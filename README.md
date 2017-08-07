[![Gitter chat](https://badges.gitter.im/gitterHQ/gitter.png)](https://gitter.im/MediaDeb)
[![Build Status](https://jenkins.ncrmnt.org/job/GithubCI/job/MediaDeb/badge/icon)](https://jenkins.ncrmnt.org/job/GithubCI/job/MediaDeb/)

# What is MediaDeb ?

Ever had an old cheap cellphone? Perhaps with a broken screen/sim slot/barely alive battery? With MediaDeb you can turn it into a Raspberry Pi-like SBC.

MediaDeb is a hacky effort to port a recent Debian to run on a mediatek phone. No chroot, no android guts whatsoever. Just pure Debian. We try to make it work with the least effort, therefore:

* Kernels built from published vendor SDK. Forward-porting all the vendor hacks is a tedious, nearly impossible task and is outside of the scope of this project

* A minimal initrd is provided to mount the actual root partition and do any hardware-specific setup

# Supported devices

| SoC      |   Device      | Feature         | Status      |
|----------|:-------------:|:----------------|------------:|
| MT6589   |  UMI X2       | Supported       | Yes         |
|          |               | Platform        | umi-x2      |
|          |               | Kernel          | 3.4.67      |
|          |               | WiFi            | YES         |
|          |               | Display         | YES         |
|          |               | Battery Hack*   | YES         |
|          |               | USB Client      | YES         |
|          |               | USB Host        | No, possible|
|          |               | UART            | YES, requires soldering|
|          |               | FM              | ?           |
|          |               | BT              | ?           |
|          |               | GPS             | ?           |
|          |               | Sound           | ?           |
|          |               | Camera          | ?           |
|          |               | Modem           | ?           |
|          |               | Magnetometer    | ?           |
|          |               | Flashlight      | ?           |

| SoC      |   Device      | Feature         | Status      |
|----------|:-------------:|:----------------|------------:|
| MT6592   |  iOcean X8    | Supported       | Yes         |
|          |               | Platform        | iocean-x8   |
|          |               | Kernel          | 3.4.67      |
|          |               | WiFi            | ?           |
|          |               | Display         | NO          |
|          |               | Battery Hack*   | YES         |
|          |               | USB Client      | YES         |
|          |               | USB Host        | No, possible|
|          |               | UART            | NO          |
|          |               | GPS             | ?           |
|          |               | FM              | ?           |
|          |               | BT              | ?           |
|          |               | Sound           | ?           |
|          |               | Camera          | ?           |
|          |               | Modem           | ?           |
|          |               | Magnetometer    | ?           |
|          |               | Flashlight      | ?           |


\* Battery Hack is a mod to the PMIC driver that changes the maximum voltage
for the battery from 4-4.2 volts to 3.7-3.8 volts. This allows to avoid 'bloating' batteries when you keep your phone always charged.

# How to build

- System Requirements.
    1. A recent Debian Stretch or Debian jessie linux distro
    2. Development packages: multistrap build-essential cmake
    3. Caffeine

- Clone the MediaDeb repository.


```
git clone https://github.com/nekromant/MediaDeb.git
```

- Create a build directory and configure the build

```
mkdir build
cd build
cmake .. -DDEVICE_NAME=iocean-x8
```

Check the table above for available devices

- Run 'make'

```
make
```

- Grab yourself a coffee, this will take a while

- Get your firmware in build/firmware and flash it with SP Flash Tool

- PROFIT!

# How to port

- Find a suitable kernel kitchen. If your cellphone has the same SoC as one of the above you may well be lucky.

- Make yourself familiar with firmware compilation and packaging process. This may be tricky.

- Add this to the end of the kernel config. This should do the minimal trick (See comments for individual parameters)
```
# Systemd will not work without these
CONFIG_DEVTMPFS=y
CONFIG_DEVTMPFS_MOUNT=y
CONFIG_CGROUPS=y
CONFIG_INOTIFY_USER=y
CONFIG_SIGNALFD=y
CONFIG_TIMERFD=y
CONFIG_EPOLL=y
CONFIG_NET=y
CONFIG_SYSFS=y
CONFIG_PROC_FS=y
CONFIG_FHANDLE=y
CONFIG_CRYPTO_USER_API_HASH=y
CONFIG_CRYPTO_HMAC=y
CONFIG_CRYPTO_SHA256=y
CONFIG_SYSFS_DEPRECATED=n
CONFIG_ANDROID_PARANOID_NETWORK=n
CONFIG_EXT4_FS_XATTR=y

# Needed for iotop to work
CONFIG_TASKSTATS=y
CONFIG_TASK_DELAY_ACCT=y
CONFIG_TASK_IO_ACCOUNTING=y
```


- Compile your own kernel

- Write a platforms/your_phone/platform.mk and send us your patches!

_NOTE:_ This section is a placeholder written by cpt. Obvious

# No warranty

MediaDeb comes with absolutely no warranty, not even of fitness for particular purpose. If you brick your hardware and your mom gets angry - it's all your fault ;)

# Credits

Andy 'ncrmnt' http://ncrmnt.org
