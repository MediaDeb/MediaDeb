PLATFORM?=umi-x2

all: firmware
include platforms/$(PLATFORM)/platform.mk

ifeq ($(TOOLCHAIN),arm-module-linux-gnueabi)
	export CROSS_COMPILE:=$(abspath build)/$(TOOLCHAIN)/bin/$(TOOLCHAIN)-
	export GNU_TARGET_NAME:=$(TOOLCHAIN)
	TOOLCHAIN_URL:=https://module.ru/mb7707/ci/toolchains/old/old/arm-module-linux-gnueabi.tgz
endif


SOURCE_DIR=$(abspath .)
export PATH:=$(abspath build/$(TOOLCHAIN)/bin):$(PATH)

$(info $===> $(PATH) | $(CROSS_COMPILE) | $(GNU_TARGET_NAME))




# Phases

init: build/.init build/$(PLATFORM).test
	mkdir -p build

build/$(PLATFORM).test:
	$(CROSS_COMPILE)gcc --version > $@

download: \
	build/$(TOOLCHAIN).tgz \
	build/bb.tgz \
	$(PLATFORM_DOWNLOADS)

unpack: build/bb.$(PLATFORM) build/$(TOOLCHAIN) $(PLATFORM_UNPACK)
build: build/$(PLATFORM).test build/initrd-$(PLATFORM) build/bb.$(PLATFORM)/.built $(PLATFORM_BUILD)

build/$(TOOLCHAIN).tgz:
	wget -c $(TOOLCHAIN_URL) -O $@

build/bb.tgz:
	wget -c https://busybox.net/downloads/busybox-1.26.2.tar.bz2 -O $@

#Unpack phase
build/bb.$(PLATFORM): build/bb.tgz
	mkdir -p $(@)
	tar vxpf $< --strip-components=1 -C $(@)

build/$(TOOLCHAIN): build/$(TOOLCHAIN).tgz
	mkdir -p $(@)
	tar vxpf $< --strip-components=2 -C $(@)

#Build
build/bb.$(PLATFORM)/.built: build/bb.$(PLATFORM) build/$(PLATFORM).test
	cd $< && cp $(SOURCE_DIR)/tools/bb_conf .config && \
	make
	touch $@

build/initrd.$(PLATFORM): build/bb.$(PLATFORM)/.built
	mkdir -p $@
	cd $@ && mkdir -p bin etc sbin proc sys dev tmp root usr/bin usr/sbin mnt
	cp -f build/bb.$(PLATFORM)/busybox $@/bin
	cp initrd/debinit $@/init
	cp initrd/debinit $@/sbin/init
	cp platforms/umi-x2/bin/*  $@/bin/
	cp platforms/umi-x2/etc/*  $@/etc/


#submodules
tools/mtk-tools:
		git submodule init $@

#initrd.gz: initrd
#	cd initrd && find . | cpio -o -c | gzip -9 > ../$@

clean:
	cd busybox && make clean
	rm -Rfv initrd initrd.gz
