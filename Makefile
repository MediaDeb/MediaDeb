PLATFORM?=umi-x2

all: build
include platforms/$(PLATFORM)/platform.mk

ifeq ($(TOOLCHAIN),arm-module-linux-gnueabi)
	export CROSS_COMPILE:=$(abspath build)/$(TOOLCHAIN)/bin/$(TOOLCHAIN)-
	export GNU_TARGET_NAME:=$(TOOLCHAIN)
	TOOLCHAIN_URL:=https://cloud.ncrmnt.org/index.php/s/7hYjCqbJgMcVYFe/download?path=%2F&files=arm-module-linux-gnueabi.tgz
endif


SOURCE_DIR=$(abspath .)
export PATH:=$(abspath build/$(TOOLCHAIN)/bin):$(PATH)

SUBMODULES+=tools/skyforge
# Phases
init: build/.init

build/.init:
	mkdir -p build
	touch $@

build/$(PLATFORM).test: build/.init build/$(TOOLCHAIN)
	cd build && echo "int main(){} " | $(CROSS_COMPILE)gcc -x c -
	scripts/check_version.sh build/a.out $(PLATFORM_KERNEL_VERSION)
	touch $@

download:
	build/$(TOOLCHAIN).tgz \
	build/bb.tgz \
	build/.submodules.$(PLATFORM)
	$(PLATFORM_DOWNLOADS)

unpack: build/bb.$(PLATFORM) build/$(TOOLCHAIN) $(PLATFORM_UNPACK)
build: unpack build/initrd.$(PLATFORM) $(PLATFORM_BUILD)

build/$(TOOLCHAIN).tgz: build/.init
	wget -c "$(TOOLCHAIN_URL)" -O $@
	touch $@


build/.submodules.$(PLATFORM):
	$(foreach s,$(SUBMODULES),git submodule update --init $(s);)
	touch $@

build/bb.tgz: build/.init
	wget -c https://busybox.net/downloads/busybox-1.26.2.tar.bz2 -O $@
	touch $@

#Unpack phase
build/bb.$(PLATFORM): build/bb.tgz
	mkdir -p $(@)
	tar vxpf $< --strip-components=1 -C $(@)

build/$(TOOLCHAIN): build/$(TOOLCHAIN).tgz
	mkdir -p $(@)
	tar vxpf $< --strip-components=1 -C $(@)

#Build
build/bb.$(PLATFORM)/busybox: build/bb.$(PLATFORM) build/$(PLATFORM).test
	cd $< && cp $(SOURCE_DIR)/tools/bb_conf .config && \
	make

build/initrd.$(PLATFORM): build/bb.$(PLATFORM)/busybox
	mkdir -p $@
	cd $@ && mkdir -p bin etc sbin proc sys dev tmp root usr/bin usr/sbin mnt
	cp -f build/bb.$(PLATFORM)/busybox $@/bin
	cp initrd/debinit $@/init
	cp initrd/debinit $@/sbin/init
	cp platforms/$(PLATFORM)/bin/*  $@/bin/
	cp platforms/$(PLATFORM)/etc/*  $@/etc/

build/fw.$(PLATFORM):
	mkdir -p $@
	cp -Rfv platforms/$(PLATFORM)/skeleton/* $@/

build/rootfs.$(PLATFORM): build/.submodules.$(PLATFORM)
	mkdir -p $@
	cp -Rfv rootfs/* $@
	cp -Rfv platforms/$(PLATFORM)/rootfs/* $@

build/rootfs.$(PLATFORM)/.built: build/rootfs.$(PLATFORM) tools/skyforge
	cd build/rootfs.$(PLATFORM) && sudo ../../tools/skyforge/skyforge build
	cd build/rootfs.$(PLATFORM) && sudo ../../tools/skyforge/skyforge clean
	touch $@





clean:
	cd busybox && make clean
	rm -Rfv initrd initrd.gz

.PHONY: $(PHONY)
