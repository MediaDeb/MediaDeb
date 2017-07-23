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
|          |               | WiFi            | WiP         |
|          |               | Display         | YES         |
|          |               | Battery Hack*   | YES         |
|          |               | USB Client      | YES         |
|          |               | USB Host        | No, possible|
|          |               | UART            | YES, requires soldering|
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
    2. Development packages: multistrap build-essential
    3. Caffeine
- Clone the MediaDeb repository.

_DO NOT UPDATE SUBMODULES OR YOU RISK BLOATING YOUR FILESSYSTEM WITH USELESS STUFF_

```
git clone https://github.com/nekromant/MediaDeb.git
```

- Run make PLATFORM=umi-x2

Check the table above for available platforms

- Get your firmware in build/fw.platform_name

# How to port

- Find a suitable kernel kitchen. If your cellphone has the same SoC as one of the above you may well be lucky.

- Make yourself familiar with firmware compilation and packaging process. This may be tricky.

- Disable CONFIG_ANDROID_PARANOID_NETWORKING in kernel config.

- Consult [Systemd README](https://github.com/systemd/systemd/blob/master/README#L34) and add required options for it to work.

- Compile your own kernel

- Write a platforms/your_phone/platform.mk and send us your patches!

_NOTE:_ This section is a placeholder written by cpt. Obvious

# No warranty

MediaDeb comes with absolutely no warranty, not even of fitness for particular purpose. If you brick your hardware and your mom gets angry - it's all your fault ;)

# Credits

Andy 'ncrmnt' http://ncrmnt.org
