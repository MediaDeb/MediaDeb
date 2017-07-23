#The SDK We're going to use
SDK_PATH=vendor_crapware/aquaris-5HD
#Pick a toolchain to use (In this case use default armel)
TOOLCHAIN:=arm-module-linux-gnueabi
#Provide any additional rules to for download phase
PLATFORM_DOWNLOADS:=$(SDK_PATH) tools/mtk-tools
#Provide any additional rules to for unpack phase
PLATFORM_UNPACK:=$(SDK_PATH)-umi-x2
#Provide any additional rules to for build phase
PLATFORM_BUILD:=build/fw.$(PLATFORM)/.install
#Fill in kernel version. Needed for automatic checks
PLATFORM_KERNEL_VERSION=3.4.67
#Debian architecture for rootfs
PLATFORM_DEBARCH=armhf

#Checkout submodule
$(SDK_PATH):
	[ -f $@/voodoo ] || git submodule update --init $@

$(SDK_PATH)-umi-x2:
	rm -f $(SDK_PATH)/.built
	cd $(SDK_PATH) && git checkout $(PLATFORM)

# Filthy mediatek build scripts require a clean environment
# Without any toplevel make leftovers
$(SDK_PATH)/.built:
	cd $(SDK_PATH) && env -i CROSS_COMPILE=$(CROSS_COMPILE) ./voodoo
	touch $@

build/fw.$(PLATFORM)/.install: \
			build/initrd.$(PLATFORM) \
			build/rootfs/.built \
			build/fw.$(PLATFORM) \
			$(SDK_PATH)/.built
	cp $(SDK_PATH)/out/target/product/lcsh89_wet_kk/kernel_lcsh89_wet_kk.bin \
		build/fw.$(PLATFORM)/boot-kernel.img
	tools/mtk-tools/repack-MTK.pl \
		-boot build/fw.$(PLATFORM)/boot-kernel.img \
		build/initrd.$(PLATFORM)/ \
		build/fw.$(PLATFORM)/boot.img
	cp -f $(SDK_PATH)/out/target/product/lcsh89_wet_kk/MBR   build/fw.$(PLATFORM)/
	cp -f $(SDK_PATH)/out/target/product/lcsh89_wet_kk/EBR1  build/fw.$(PLATFORM)/
	cp -f $(SDK_PATH)/out/target/product/lcsh89_wet_kk/*.txt build/fw.$(PLATFORM)/
	cp -f build/rootfs/rootfs.img build/fw.$(PLATFORM)/system.img
	#These confuse SP Flash tool
	rm build/fw.$(PLATFORM)/boot-args.txt
	rm build/fw.$(PLATFORM)/boot-kernel.img
	touch $@

PHONY+=$(SDK_PATH)
