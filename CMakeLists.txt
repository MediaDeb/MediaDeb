cmake_minimum_required(VERSION 3.0)
project(mediadeb)
include(ExternalProject)


find_program(LSB_RELEASE lsb_release)
execute_process(COMMAND ${LSB_RELEASE} -is
    OUTPUT_VARIABLE LSB_RELEASE_ID_SHORT
    OUTPUT_STRIP_TRAILING_WHITESPACE
)

execute_process(COMMAND ${LSB_RELEASE} -rs
    OUTPUT_VARIABLE LSB_RELEASE_ID_VERSION
    OUTPUT_STRIP_TRAILING_WHITESPACE
)

if (NOT DEVICE_NAME)
    set(DEVICE_NAME            "umi-x2")
    message("HINT: use -DDEVICE_NAME=name to specify a different device")
endif()

set(PLATFORM_DIR ${CMAKE_SOURCE_DIR}/platforms/${DEVICE_NAME})
include(${PLATFORM_DIR}/platform.cmake)

set(INITRD_DIR ${CMAKE_BINARY_DIR}/initrd)
set(DL_DIR ${CMAKE_SOURCE_DIR}/tarballs)
# cross-compilation variables
set(CROSS_COMPILE "${CMAKE_BINARY_DIR}/toolchain-prefix/src/toolchain/bin/${GNU_TARGET_NAME}-")

message(STATUS "Populating initial initrd directory: ${INITRD_DIR}")

# Right now this is the only toolchain and it works
# aarch64 may require a different one, but so far no aarch64 devices
if (GNU_TARGET_NAME STREQUAL "arm-module-linux-gnueabi")
    set(TOOLCHAIN_URL https://cloud.ncrmnt.org/index.php/s/7hYjCqbJgMcVYFe/download?path=%2F&files=arm-module-linux-gnueabi.tgz)
    set(TOOLCHAIN_MD5 eec86847bb0f680814685d64ef2a1ce0)
    set(TOOLCHAIN_VALID YES)
endif()


set(FIRMWARE_DIR ${CMAKE_BINARY_DIR}/firmware)
# Party-time, let's populate directories
file(COPY "${CMAKE_SOURCE_DIR}/initrd/" DESTINATION ${CMAKE_BINARY_DIR}/initrd)
file(MAKE_DIRECTORY ${CMAKE_BINARY_DIR}/rootfs)

# And add device-specific files
file(COPY "${PLATFORM_DIR}/skeleton/" DESTINATION ${FIRMWARE_DIR})
file(COPY "${PLATFORM_DIR}/initrd/" DESTINATION ${CMAKE_BINARY_DIR}/initrd)


ExternalProject_Add (toolchain
        URL ${TOOLCHAIN_URL}
        URL_MD5 ${TOOLCHAIN_MD5}
        DOWNLOAD_DIR ${DL_DIR}
        CONFIGURE_COMMAND ${CROSS_COMPILE}gcc --version
        BUILD_COMMAND echo "int main(){} " | ${CROSS_COMPILE}gcc -x c -
        INSTALL_COMMAND ${CMAKE_SOURCE_DIR}/scripts/check_version.sh a.out ${DEVICE_KERNEL_VERSION}
)

ExternalProject_Add (busybox
    DEPENDS toolchain
    URL https://busybox.net/downloads/busybox-1.26.2.tar.bz2
    URL_MD5 bb59d25ee2643db20f212eec539429f1
    DOWNLOAD_DIR ${DL_DIR}
    CONFIGURE_COMMAND cp ${CMAKE_SOURCE_DIR}/configs/bb_conf .config
    BUILD_COMMAND make GNU_TARGET_NAME=${GNU_TARGET_NAME} CROSS_COMPILE=${CROSS_COMPILE}
    BINARY_DIR busybox
    SOURCE_DIR busybox
    INSTALL_COMMAND cp busybox ${INITRD_DIR}/bin
)

set(SKYFORGE_DIR ${DL_DIR}/skyforge)
ExternalProject_Add (skyforge
    GIT_REPOSITORY https://github.com/RC-MODULE/skyforge.git
    GIT_TAG ng
    SOURCE_DIR ${SKYFORGE_DIR}
    BUILD_COMMAND ""
    UPDATE_COMMAND ""
    CONFIGURE_COMMAND ""
    INSTALL_COMMAND ""
)

ExternalProject_Add (rootfs
    DEPENDS skyforge
    SOURCE_DIR ${CMAKE_BINARY_DIR}/rootfs
    DOWNLOAD_COMMAND cp -Rfv ${CMAKE_SOURCE_DIR}/rootfs ${CMAKE_BINARY_DIR}/
    CONFIGURE_COMMAND cp -Rfv ${PLATFORM_DIR}/rootfs ${CMAKE_BINARY_DIR}/
    BINARY_DIR ${CMAKE_BINARY_DIR}/rootfs
    BUILD_COMMAND pwd && sudo ${SKYFORGE_DIR}/skyforge build
    INSTALL_COMMAND sudo ${SKYFORGE_DIR}/skyforge clean
)

###############################
#crapware/mediatek.cmake
set(MTK_TOOLS_DIR ${DL_DIR}/mtk-tools)
ExternalProject_Add (mtk-tools
    SOURCE_DIR ${MTK_TOOLS_DIR}
    BINARY_DIR ${MTK_TOOLS_DIR}
    GIT_REPOSITORY https://github.com/bgcngm/mtk-tools.git
    STAMP_DIR ${MTK_TOOLS_DIR}.stamps
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ""
    INSTALL_COMMAND ""
    UPDATE_COMMAND ""
)

ExternalProject_Add (kernel
    DEPENDS toolchain
    SOURCE_DIR ${DL_DIR}/${DEVICE_CRAPWARE_NAME}
    BINARY_DIR ${DL_DIR}/${DEVICE_CRAPWARE_NAME}
    STAMP_DIR ${DL_DIR}/${DEVICE_CRAPWARE_NAME}.stamps
    GIT_REPOSITORY ${DEVICE_CRAPWARE_GIT}
    GIT_TAG ${DEVICE_CRAPWARE_BRANCH}
    CONFIGURE_COMMAND ""
    UPDATE_COMMAND ""
# Mediatek's build scripts don't like it when embedded into make.
# SO we have to sanitize environment
    BUILD_COMMAND env -i bash -c "CROSS_COMPILE=${CROSS_COMPILE} ./makeMtk -t ${DEVICE_MTK_TARGET} n k"
    INSTALL_COMMAND ""
)

set(MTK_ARTIFACT_DIR ${DL_DIR}/${DEVICE_CRAPWARE_NAME}/out/target/product/${DEVICE_MTK_TARGET})

add_custom_target(kernel-install
    DEPENDS kernel
    COMMAND cp -f ${MTK_ARTIFACT_DIR}/*.txt ${FIRMWARE_DIR}
    COMMAND cp -f ${MTK_ARTIFACT_DIR}/kernel_${DEVICE_MTK_TARGET}.bin ${FIRMWARE_DIR}/boot-kernel.img
    COMMAND cp -f ${MTK_ARTIFACT_DIR}/EBR1  ${FIRMWARE_DIR}
    COMMAND cp -f ${MTK_ARTIFACT_DIR}/MBR   ${FIRMWARE_DIR}
)

add_custom_target(kernel-package
    ALL
    DEPENDS kernel-install
    WORKING_DIRECTORY ${FIRMWARE_DIR}
    COMMAND cp -f ${PLATFORM_DIR}/skeleton/boot-args.txt .
    COMMAND ${MTK_TOOLS_DIR}/repack-MTK.pl
    -boot boot-kernel.img ${INITRD_DIR} boot.img
    COMMAND rm -f boot-kernel.img boot-args.txt
)


message("----  MEDIADEB CONFIG SUMMARY  ----")
message("Host Linux distro:     ${LSB_RELEASE_ID_SHORT}")
message("Host Linux version:    ${LSB_RELEASE_ID_VERSION}")
message("Device name :          ${DEVICE_NAME}")
message("Distribution:          ${DEVICE_DISTRO}")
message("Maintainer:            ${DEVICE_MAINTAINER}")
message("Debian Architecture:   ${DEVICE_DEBARCH}")
message("Distribution variant:  ${DEVICE_ROOT_VARIANT}")
message("Kernel Version:        ${DEVICE_KERNEL_VERSION}")
message("---- ---- ---- ---- ---- ---- ----")

if (NOT LSB_RELEASE_ID_SHORT STREQUAL "Debian")
    message("WARNING! WARNING! WARNING! WARNING!")
    message("You are running ${LSB_RELEASE_ID_SHORT} which is not supported/tested by mediadeb")
    message("Some components (e.g. rootfs building) may fail")
    message("Proceed at your own risk")
    message("WARNING! WARNING! WARNING! WARNING!")
endif()
