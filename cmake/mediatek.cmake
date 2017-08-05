###############################
# Rules for MT689/MT6592 and so on
#

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
    DEPENDS kernel-install mtk-tools busybox
    WORKING_DIRECTORY ${FIRMWARE_DIR}
    COMMAND cp -f ${PLATFORM_DIR}/skeleton/boot-args.txt .
    COMMAND ${MTK_TOOLS_DIR}/repack-MTK.pl
    -boot boot-kernel.img ${INITRD_DIR}/ boot.img
    COMMAND rm -fv boot-kernel.img boot-args.txt
)
