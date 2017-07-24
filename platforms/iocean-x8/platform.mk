#The SDK We're going to use
SDK_PATH=vendor_crapware/MT6592-KK-KERNEL
#Pick a toolchain to use (In this case use default armel)
TOOLCHAIN:=arm-module-linux-gnueabi
#Provide any additional rules to for download phase
PLATFORM_DOWNLOADS:=$(SDK_PATH) tools/mtk-tools
#Provide any additional rules to for unpack phase
PLATFORM_UNPACK:=$(SDK_PATH)-checkout
#Provide any additional rules to for build phase
PLATFORM_BUILD:=build/fw.$(PLATFORM)/.install
#Fill in kernel version. Needed for automatic checks
PLATFORM_KERNEL_VERSION=3.4.67
#Debian architecture for rootfs
PLATFORM_DEBARCH=armhf

SUBMODULES+=tools/mtk-tools $(SDK_PATH)

PRODUCT=wiko

#Check out branch
$(SDK_PATH)-checkout: build/.submodules.$(PLATFORM)
	rm -f $(SDK_PATH)/.built
	cd $(SDK_PATH) && git checkout $(PLATFORM)

# Filthy mediatek build scripts require a clean environment
# Without any toplevel make leftovers
$(SDK_PATH)/.built: build/.submodules.$(PLATFORM)
	cd $(SDK_PATH) && env -i CROSS_COMPILE=$(CROSS_COMPILE) ./mk $(PRODUCT) n k
	touch $@

build/fw.$(PLATFORM)/.install: \
			build/initrd.$(PLATFORM) \
			build/rootfs.$(PLATFORM)/.built \
			build/fw.$(PLATFORM) \
			$(SDK_PATH)/.built
	cp $(SDK_PATH)/out/target/product/$(PRODUCT)/kernel_$(PRODUCT).bin \
		build/fw.$(PLATFORM)/boot-kernel.img
	tools/mtk-tools/repack-MTK.pl \
		-boot build/fw.$(PLATFORM)/boot-kernel.img \
		build/initrd.$(PLATFORM)/ \
		build/fw.$(PLATFORM)/boot.img
	cp -f $(SDK_PATH)/out/target/product/$(PRODUCT)/MBR   build/fw.$(PLATFORM)/
	cp -f $(SDK_PATH)/out/target/product/$(PRODUCT)/EBR1  build/fw.$(PLATFORM)/
	cp -f $(SDK_PATH)/out/target/product/$(PRODUCT)/*.txt build/fw.$(PLATFORM)/
	cp -f build/rootfs.$(PLATFORM)/rootfs.img build/fw.$(PLATFORM)/system.img
	#These confuse SP Flash tool
	rm build/fw.$(PLATFORM)/boot-args.txt
	rm build/fw.$(PLATFORM)/boot-kernel.img
	touch $@

PHONY+=$(SDK_PATH)
