#The SDK We're going to use
SDK_PATH=vendor_crapware/aquaris-5HD
#Pick a toolchain to use (In this case use default armel)
TOOLCHAIN:=arm-module-linux-gnueabi
#Provide any additional rules to for download phase
PLATFORM_DOWNLOADS:=$(SDK_PATH) tools/mtk-tools
#Provide any additional rules to for unpack phase
PLATFORM_UNPACK:=$(SDK_PATH)-umi-x2
#Provide any additional rules to for build phase
PLATFORM_BUILD:=$(SDK_PATH)/.built


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

build/fw.$(PLATFORM): $(SDK_PATH)/.built
	mkdir $@
	tools/mtk-tools/repack-MTK.pl \
		-boot $(SDK_PATH)/out/target/product/lcsh89_wet_kk/kernel_lcsh89_wet_kk.bin \
		build/initrd.$(PLATFORM)/ \
		$@/boot.img


PHONY+=$(SDK_PATH)
	#cp -f $(SDK_PATH)/out/target/product/lcsh89_wet_kk/MBR ./fw/
	#cp -f $(SDK_PATH)/out/target/product/lcsh89_wet_kk/EBR1 ./fw/
	#cp -f $(SDK_PATH)/out/target/product/lcsh89_wet_kk/*.txt ./fw/
