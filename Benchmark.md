# A note about benchmarks

## General matter

- These benchmarks are all made (and should be made) using 'armhf' Debian Stretch rootfs

- OpenSSL 'speed' measures single-core performance since it runs all tests in 1 thread.

- hdparm measures read performance of the eMMC

- iperf measures the network connectivity speed over usb (eem seems to be the fastest)

- If you think some other benchmarking tools are worth running - open an issue at github

## How to run the tests on your device

```
# echo performance > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
# openssl speed
# hdparm -Tt /dev/mmcblk0p4
```


# Results

## MT6592

### iocean-x8

- OpenSSL
```
Doing md4 for 3s on 16 size blocks: 1313556 md4's in 2.98s
Doing md4 for 3s on 64 size blocks: 1196865 md4's in 3.00s
Doing md4 for 3s on 256 size blocks: 916873 md4's in 2.99s
Doing md4 for 3s on 1024 size blocks: 485397 md4's in 3.00s
Doing md4 for 3s on 8192 size blocks: 89804 md4's in 3.00s
Doing md4 for 3s on 16384 size blocks: 46115 md4's in 2.98s
Doing md5 for 3s on 16 size blocks: 4594594 md5's in 3.00s
Doing md5 for 3s on 64 size blocks: 3113214 md5's in 3.00s
Doing md5 for 3s on 256 size blocks: 1599370 md5's in 2.99s
Doing md5 for 3s on 1024 size blocks: 546263 md5's in 3.00s
Doing md5 for 3s on 8192 size blocks: 76489 md5's in 3.00s
Doing md5 for 3s on 16384 size blocks: 38536 md5's in 3.00s
Doing hmac(md5) for 3s on 16 size blocks: 1459473 hmac(md5)'s in 2.98s
Doing hmac(md5) for 3s on 64 size blocks: 1274682 hmac(md5)'s in 2.99s
Doing hmac(md5) for 3s on 256 size blocks: 918488 hmac(md5)'s in 3.00s
Doing hmac(md5) for 3s on 1024 size blocks: 434888 hmac(md5)'s in 2.99s
Doing hmac(md5) for 3s on 8192 size blocks: 73914 hmac(md5)'s in 3.00s
Doing hmac(md5) for 3s on 16384 size blocks: 37817 hmac(md5)'s in 3.00s
Doing sha1 for 3s on 16 size blocks: 3088316 sha1's in 2.99s
Doing sha1 for 3s on 64 size blocks: 1931938 sha1's in 2.99s
Doing sha1 for 3s on 256 size blocks: 928317 sha1's in 2.99s
Doing sha1 for 3s on 1024 size blocks: 301219 sha1's in 3.00s
Doing sha1 for 3s on 8192 size blocks: 41118 sha1's in 2.99s
Doing sha1 for 3s on 16384 size blocks: 20789 sha1's in 3.00s
Doing sha256 for 3s on 16 size blocks: 1995815 sha256's in 3.00s
Doing sha256 for 3s on 64 size blocks: 1169455 sha256's in 2.99s
Doing sha256 for 3s on 256 size blocks: 533702 sha256's in 3.00s
Doing sha256 for 3s on 1024 size blocks: 167580 sha256's in 3.00s
Doing sha256 for 3s on 8192 size blocks: 22524 sha256's in 2.98s
Doing sha256 for 3s on 16384 size blocks: 11380 sha256's in 3.00s
Doing sha512 for 3s on 16 size blocks: 1085090 sha512's in 3.00s
Doing sha512 for 3s on 64 size blocks: 1088530 sha512's in 3.00s
Doing sha512 for 3s on 256 size blocks: 405289 sha512's in 2.99s
Doing sha512 for 3s on 1024 size blocks: 142165 sha512's in 3.00s
Doing sha512 for 3s on 8192 size blocks: 20119 sha512's in 3.00s
Doing sha512 for 3s on 16384 size blocks: 10099 sha512's in 2.97s
Doing whirlpool for 3s on 16 size blocks: 385343 whirlpool's in 3.00s
Doing whirlpool for 3s on 64 size blocks: 198535 whirlpool's in 3.00s
Doing whirlpool for 3s on 256 size blocks: 80671 whirlpool's in 2.99s
Doing whirlpool for 3s on 1024 size blocks: 24096 whirlpool's in 3.00s
Doing whirlpool for 3s on 8192 size blocks: 3188 whirlpool's in 3.00s
Doing whirlpool for 3s on 16384 size blocks: 1598 whirlpool's in 2.99s
Doing rmd160 for 3s on 16 size blocks: 946378 rmd160's in 2.98s
Doing rmd160 for 3s on 64 size blocks: 729461 rmd160's in 3.00s
Doing rmd160 for 3s on 256 size blocks: 436324 rmd160's in 3.00s
Doing rmd160 for 3s on 1024 size blocks: 165529 rmd160's in 2.99s
Doing rmd160 for 3s on 8192 size blocks: 24568 rmd160's in 3.00s
Doing rmd160 for 3s on 16384 size blocks: 12434 rmd160's in 3.00s
Doing rc4 for 3s on 16 size blocks: 15484102 rc4's in 2.98s
Doing rc4 for 3s on 64 size blocks: 4485093 rc4's in 3.00s
Doing rc4 for 3s on 256 size blocks: 1165064 rc4's in 3.00s
Doing rc4 for 3s on 1024 size blocks: 293696 rc4's in 3.00s
Doing rc4 for 3s on 8192 size blocks: 36702 rc4's in 2.99s
Doing rc4 for 3s on 16384 size blocks: 18424 rc4's in 3.00s
Doing des cbc for 3s on 16 size blocks: 4117757 des cbc's in 3.00s
Doing des cbc for 3s on 64 size blocks: 1097455 des cbc's in 2.98s
Doing des cbc for 3s on 256 size blocks: 280724 des cbc's in 3.00s
Doing des cbc for 3s on 1024 size blocks: 70517 des cbc's in 3.00s
Doing des cbc for 3s on 8192 size blocks: 8776 des cbc's in 2.99s
Doing des cbc for 3s on 16384 size blocks: 4413 des cbc's in 3.00s
Doing des ede3 for 3s on 16 size blocks: 1529026 des ede3's in 3.00s
Doing des ede3 for 3s on 64 size blocks: 394436 des ede3's in 2.99s
Doing des ede3 for 3s on 256 size blocks: 98982 des ede3's in 2.98s
Doing des ede3 for 3s on 1024 size blocks: 24918 des ede3's in 3.00s
Doing des ede3 for 3s on 8192 size blocks: 3117 des ede3's in 3.00s
Doing des ede3 for 3s on 16384 size blocks: 1550 des ede3's in 2.99s
Doing aes-128 cbc for 3s on 16 size blocks: 7409228 aes-128 cbc's in 3.00s
Doing aes-128 cbc for 3s on 64 size blocks: 2066323 aes-128 cbc's in 3.00s
Doing aes-128 cbc for 3s on 256 size blocks: 530073 aes-128 cbc's in 2.99s
Doing aes-128 cbc for 3s on 1024 size blocks: 134429 aes-128 cbc's in 3.00s
Doing aes-128 cbc for 3s on 8192 size blocks: 16844 aes-128 cbc's in 3.00s
Doing aes-128 cbc for 3s on 16384 size blocks: 8415 aes-128 cbc's in 2.99s
Doing aes-192 cbc for 3s on 16 size blocks: 6359718 aes-192 cbc's in 2.99s
Doing aes-192 cbc for 3s on 64 size blocks: 1764675 aes-192 cbc's in 3.00s
Doing aes-192 cbc for 3s on 256 size blocks: 454141 aes-192 cbc's in 3.00s
Doing aes-192 cbc for 3s on 1024 size blocks: 113686 aes-192 cbc's in 2.99s
Doing aes-192 cbc for 3s on 8192 size blocks: 14326 aes-192 cbc's in 3.00s
Doing aes-192 cbc for 3s on 16384 size blocks: 7161 aes-192 cbc's in 3.00s
Doing aes-256 cbc for 3s on 16 size blocks: 5675873 aes-256 cbc's in 2.98s
Doing aes-256 cbc for 3s on 64 size blocks: 1562222 aes-256 cbc's in 3.00s
Doing aes-256 cbc for 3s on 256 size blocks: 400787 aes-256 cbc's in 3.00s
Doing aes-256 cbc for 3s on 1024 size blocks: 100776 aes-256 cbc's in 3.00s
Doing aes-256 cbc for 3s on 8192 size blocks: 12570 aes-256 cbc's in 2.99s
Doing aes-256 cbc for 3s on 16384 size blocks: 6314 aes-256 cbc's in 3.00s
Doing aes-128 ige for 3s on 16 size blocks: 6724598 aes-128 ige's in 3.00s
Doing aes-128 ige for 3s on 64 size blocks: 1903962 aes-128 ige's in 2.98s
Doing aes-128 ige for 3s on 256 size blocks: 495744 aes-128 ige's in 3.00s
Doing aes-128 ige for 3s on 1024 size blocks: 125054 aes-128 ige's in 3.00s
Doing aes-128 ige for 3s on 8192 size blocks: 15597 aes-128 ige's in 2.99s
Doing aes-128 ige for 3s on 16384 size blocks: 7817 aes-128 ige's in 2.99s
Doing aes-192 ige for 3s on 16 size blocks: 5920147 aes-192 ige's in 3.00s
Doing aes-192 ige for 3s on 64 size blocks: 1663316 aes-192 ige's in 3.00s
Doing aes-192 ige for 3s on 256 size blocks: 428493 aes-192 ige's in 2.98s
Doing aes-192 ige for 3s on 1024 size blocks: 108607 aes-192 ige's in 3.00s
Doing aes-192 ige for 3s on 8192 size blocks: 13609 aes-192 ige's in 3.00s
Doing aes-192 ige for 3s on 16384 size blocks: 6756 aes-192 ige's in 2.99s
Doing aes-256 ige for 3s on 16 size blocks: 5340692 aes-256 ige's in 3.00s
Doing aes-256 ige for 3s on 64 size blocks: 1484046 aes-256 ige's in 3.00s
Doing aes-256 ige for 3s on 256 size blocks: 380273 aes-256 ige's in 2.98s
Doing aes-256 ige for 3s on 1024 size blocks: 96331 aes-256 ige's in 3.00s
Doing aes-256 ige for 3s on 8192 size blocks: 12070 aes-256 ige's in 3.00s
Doing aes-256 ige for 3s on 16384 size blocks: 6020 aes-256 ige's in 2.99s
Doing ghash for 3s on 16 size blocks: 15076736 ghash's in 2.99s
Doing ghash for 3s on 64 size blocks: 4418528 ghash's in 3.00s
Doing ghash for 3s on 256 size blocks: 1152784 ghash's in 3.00s
Doing ghash for 3s on 1024 size blocks: 289862 ghash's in 2.99s
Doing ghash for 3s on 8192 size blocks: 36547 ghash's in 2.99s
Doing ghash for 3s on 16384 size blocks: 18267 ghash's in 2.99s
Doing camellia-128 cbc for 3s on 16 size blocks: 6063088 camellia-128 cbc's in 2.98s
Doing camellia-128 cbc for 3s on 64 size blocks: 1751475 camellia-128 cbc's in 3.00s
Doing camellia-128 cbc for 3s on 256 size blocks: 456077 camellia-128 cbc's in 3.00s
Doing camellia-128 cbc for 3s on 1024 size blocks: 115105 camellia-128 cbc's in 3.00s
Doing camellia-128 cbc for 3s on 8192 size blocks: 14377 camellia-128 cbc's in 2.99s
Doing camellia-128 cbc for 3s on 16384 size blocks: 7219 camellia-128 cbc's in 3.00s
Doing camellia-192 cbc for 3s on 16 size blocks: 4971104 camellia-192 cbc's in 3.00s
Doing camellia-192 cbc for 3s on 64 size blocks: 1379849 camellia-192 cbc's in 2.98s
Doing camellia-192 cbc for 3s on 256 size blocks: 358379 camellia-192 cbc's in 3.00s
Doing camellia-192 cbc for 3s on 1024 size blocks: 90307 camellia-192 cbc's in 3.00s
Doing camellia-192 cbc for 3s on 8192 size blocks: 11259 camellia-192 cbc's in 2.99s
Doing camellia-192 cbc for 3s on 16384 size blocks: 5655 camellia-192 cbc's in 3.00s
Doing camellia-256 cbc for 3s on 16 size blocks: 4965259 camellia-256 cbc's in 3.00s
Doing camellia-256 cbc for 3s on 64 size blocks: 1384729 camellia-256 cbc's in 2.99s
Doing camellia-256 cbc for 3s on 256 size blocks: 356650 camellia-256 cbc's in 2.98s
Doing camellia-256 cbc for 3s on 1024 size blocks: 90317 camellia-256 cbc's in 3.00s
Doing camellia-256 cbc for 3s on 8192 size blocks: 11317 camellia-256 cbc's in 3.00s
Doing camellia-256 cbc for 3s on 16384 size blocks: 5627 camellia-256 cbc's in 2.99s
Doing seed cbc for 3s on 16 size blocks: 5100382 seed cbc's in 3.00s
Doing seed cbc for 3s on 64 size blocks: 1432415 seed cbc's in 3.00s
Doing seed cbc for 3s on 256 size blocks: 368047 seed cbc's in 2.98s
Doing seed cbc for 3s on 1024 size blocks: 93270 seed cbc's in 3.00s
Doing seed cbc for 3s on 8192 size blocks: 11688 seed cbc's in 3.00s
Doing seed cbc for 3s on 16384 size blocks: 5836 seed cbc's in 3.00s
Doing rc2 cbc for 3s on 16 size blocks: 3200223 rc2 cbc's in 2.99s
Doing rc2 cbc for 3s on 64 size blocks: 853227 rc2 cbc's in 3.00s
Doing rc2 cbc for 3s on 256 size blocks: 216649 rc2 cbc's in 3.00s
Doing rc2 cbc for 3s on 1024 size blocks: 54090 rc2 cbc's in 2.98s
Doing rc2 cbc for 3s on 8192 size blocks: 6805 rc2 cbc's in 3.00s
Doing rc2 cbc for 3s on 16384 size blocks: 3402 rc2 cbc's in 3.00s
Doing blowfish cbc for 3s on 16 size blocks: 7008822 blowfish cbc's in 2.99s
Doing blowfish cbc for 3s on 64 size blocks: 2061576 blowfish cbc's in 3.00s
Doing blowfish cbc for 3s on 256 size blocks: 538322 blowfish cbc's in 3.00s
Doing blowfish cbc for 3s on 1024 size blocks: 136007 blowfish cbc's in 3.00s
Doing blowfish cbc for 3s on 8192 size blocks: 16986 blowfish cbc's in 2.99s
Doing blowfish cbc for 3s on 16384 size blocks: 8533 blowfish cbc's in 3.00s
Doing cast cbc for 3s on 16 size blocks: 6014943 cast cbc's in 3.00s
Doing cast cbc for 3s on 64 size blocks: 1725920 cast cbc's in 2.98s
Doing cast cbc for 3s on 256 size blocks: 451267 cast cbc's in 3.00s
Doing cast cbc for 3s on 1024 size blocks: 113957 cast cbc's in 3.00s
Doing cast cbc for 3s on 8192 size blocks: 14207 cast cbc's in 2.99s
Doing cast cbc for 3s on 16384 size blocks: 7139 cast cbc's in 3.00s
Doing 512 bit private rsa's for 10s: 17120 512 bit private RSA's in 9.98s
Doing 512 bit public rsa's for 10s: RSA verify failure
3068867152:error:0407008A:rsa routines:RSA_padding_check_PKCS1_type_1:invalid padding:../crypto/rsa/rsa_pk1.c:67:
3068867152:error:04067072:rsa routines:rsa_ossl_public_decrypt:padding check failed:../crypto/rsa/rsa_ossl.c:576:
-1 512 bit public RSA's in 9.99s
Doing 1024 bit private rsa's for 10s: 4270 1024 bit private RSA's in 9.99s
Doing 1024 bit public rsa's for 10s: RSA verify failure
3068867152:error:0407008A:rsa routines:RSA_padding_check_PKCS1_type_1:invalid padding:../crypto/rsa/rsa_pk1.c:67:
3068867152:error:04067072:rsa routines:rsa_ossl_public_decrypt:padding check failed:../crypto/rsa/rsa_ossl.c:576:
-1 1024 bit public RSA's in 9.99s
Doing 2048 bit private rsa's for 10s: 768 2048 bit private RSA's in 10.03s
Doing 2048 bit public rsa's for 10s: 31499 2048 bit public RSA's in 9.98s
Doing 3072 bit private rsa's for 10s: 270 3072 bit private RSA's in 10.01s
Doing 3072 bit public rsa's for 10s: RSA verify failure
3068867152:error:0407008A:rsa routines:RSA_padding_check_PKCS1_type_1:invalid padding:../crypto/rsa/rsa_pk1.c:67:
3068867152:error:04067072:rsa routines:rsa_ossl_public_decrypt:padding check failed:../crypto/rsa/rsa_ossl.c:576:
-1 3072 bit public RSA's in 9.98s
Doing 4096 bit private rsa's for 10s: 126 4096 bit private RSA's in 10.30s
Doing 4096 bit public rsa's for 10s: RSA verify failure
3068867152:error:0407008A:rsa routines:RSA_padding_check_PKCS1_type_1:invalid padding:../crypto/rsa/rsa_pk1.c:67:
3068867152:error:04067072:rsa routines:rsa_ossl_public_decrypt:padding check failed:../crypto/rsa/rsa_ossl.c:576:
-1 4096 bit public RSA's in 9.99s
Doing 7680 bit private rsa's for 10s: 22 7680 bit private RSA's in 11.77s
Doing 7680 bit public rsa's for 10s: RSA verify failure
3068867152:error:0407008A:rsa routines:RSA_padding_check_PKCS1_type_1:invalid padding:../crypto/rsa/rsa_pk1.c:67:
3068867152:error:04067072:rsa routines:rsa_ossl_public_decrypt:padding check failed:../crypto/rsa/rsa_ossl.c:576:
-1 7680 bit public RSA's in 9.98s
Doing 15360 bit private rsa's for 10s: 3 15360 bit private RSA's in 22.82s
Doing 15360 bit public rsa's for 10s: RSA verify failure
3068867152:error:0407008A:rsa routines:RSA_padding_check_PKCS1_type_1:invalid padding:../crypto/rsa/rsa_pk1.c:67:
3068867152:error:04067072:rsa routines:rsa_ossl_public_decrypt:padding check failed:../crypto/rsa/rsa_ossl.c:576:
-1 15360 bit public RSA's in 9.99s
Doing 512 bit sign dsa's for 10s: 18582 512 bit DSA signs in 9.94s
Doing 512 bit verify dsa's for 10s: DSA verify failure
-1 512 bit DSA verify in 9.98s
Doing 1024 bit sign dsa's for 10s: 8508 1024 bit DSA signs in 9.97s
DSA verify failure.  No DSA verify will be done.
Doing 2048 bit sign dsa's for 10s: 2912 2048 bit DSA signs in 9.98s
DSA verify failure.  No DSA verify will be done.
Doing 160 bit sign ecdsa's for 10s: 14049 160 bit ECDSA signs in 9.95s
Doing 160 bit verify ecdsa's for 10s: 5607 160 bit ECDSA verify in 9.98s
Doing 192 bit sign ecdsa's for 10s: 15084 192 bit ECDSA signs in 9.94s
Doing 192 bit verify ecdsa's for 10s: 4029 192 bit ECDSA verify in 9.98s
Doing 224 bit sign ecdsa's for 10s: 11800 224 bit ECDSA signs in 9.97s
Doing 224 bit verify ecdsa's for 10s: 3034 224 bit ECDSA verify in 9.99s
Doing 256 bit sign ecdsa's for 10s: 20058 256 bit ECDSA signs in 9.95s
Doing 256 bit verify ecdsa's for 10s: 8293 256 bit ECDSA verify in 9.99s
Doing 384 bit sign ecdsa's for 10s: 4023 384 bit ECDSA signs in 9.99s
Doing 384 bit verify ecdsa's for 10s: 1047 384 bit ECDSA verify in 9.99s
Doing 521 bit sign ecdsa's for 10s: 1822 521 bit ECDSA signs in 9.96s
Doing 521 bit verify ecdsa's for 10s: 478 521 bit ECDSA verify in 10.00s
Doing 163 bit sign ecdsa's for 10s: 6262 163 bit ECDSA signs in 9.99s
Doing 163 bit verify ecdsa's for 10s: 2245 163 bit ECDSA verify in 9.99s
Doing 233 bit sign ecdsa's for 10s: 3235 233 bit ECDSA signs in 9.99s
Doing 233 bit verify ecdsa's for 10s: 1334 233 bit ECDSA verify in 9.99s
Doing 283 bit sign ecdsa's for 10s: 2088 283 bit ECDSA signs in 9.99s
Doing 283 bit verify ecdsa's for 10s: ECDSA verify failure
3068867152:error:100B906B:elliptic curve routines:EC_POINT_set_affine_coordinates_GF2m:point is not on curve:../crypto/ec/ec_lib.c:733:
3068867152:error:100FA010:elliptic curve routines:ossl_ecdsa_verify_sig:EC lib:../crypto/ec/ecdsa_ossl.c:432:
-1 283 bit ECDSA verify in 10.00s
Doing 409 bit sign ecdsa's for 10s: 823 409 bit ECDSA signs in 10.00s
Doing 409 bit verify ecdsa's for 10s: 376 409 bit ECDSA verify in 10.01s
Doing 571 bit sign ecdsa's for 10s: 340 571 bit ECDSA signs in 9.99s
Doing 571 bit verify ecdsa's for 10s: ECDSA verify failure
3068867152:error:100B906B:elliptic curve routines:EC_POINT_set_affine_coordinates_GF2m:point is not on curve:../crypto/ec/ec_lib.c:733:
3068867152:error:100FA010:elliptic curve routines:ossl_ecdsa_verify_sig:EC lib:../crypto/ec/ecdsa_ossl.c:432:
-1 571 bit ECDSA verify in 10.01s
Doing 163 bit sign ecdsa's for 10s: 6303 163 bit ECDSA signs in 9.98s
Doing 163 bit verify ecdsa's for 10s: 2109 163 bit ECDSA verify in 9.98s
Doing 233 bit sign ecdsa's for 10s: 3253 233 bit ECDSA signs in 9.97s
Doing 233 bit verify ecdsa's for 10s: 1230 233 bit ECDSA verify in 9.99s
Doing 283 bit sign ecdsa's for 10s: 2080 283 bit ECDSA signs in 9.99s
Doing 283 bit verify ecdsa's for 10s: 675 283 bit ECDSA verify in 9.99s
Doing 409 bit sign ecdsa's for 10s: 820 409 bit ECDSA signs in 10.00s
Doing 409 bit verify ecdsa's for 10s: 335 409 bit ECDSA verify in 10.00s
Doing 571 bit sign ecdsa's for 10s: 340 571 bit ECDSA signs in 10.00s
Doing 571 bit verify ecdsa's for 10s: 143 571 bit ECDSA verify in 10.01s
ECDSA failure.
3068867152:error:100AE081:elliptic curve routines:EC_GROUP_new_by_curve_name:unknown group:../crypto/ec/ec_curve.c:3100:
Doing 160 bit  ecdh's for 10s: 6657 160-bit ECDH ops in 9.98s
Doing 192 bit  ecdh's for 10s: 4946 192-bit ECDH ops in 9.99s
Doing 224 bit  ecdh's for 10s: 3751 224-bit ECDH ops in 9.98s
Doing 256 bit  ecdh's for 10s: 10965 256-bit ECDH ops in 9.98s
Doing 384 bit  ecdh's for 10s: 1233 384-bit ECDH ops in 9.98s
Doing 521 bit  ecdh's for 10s: 559 521-bit ECDH ops in 9.99s
Doing 163 bit  ecdh's for 10s: 4576 163-bit ECDH ops in 9.98s
Doing 233 bit  ecdh's for 10s: 2856 233-bit ECDH ops in 9.98s
Doing 283 bit  ecdh's for 10s: 1511 283-bit ECDH ops in 9.99s
Doing 409 bit  ecdh's for 10s: 759 409-bit ECDH ops in 10.00s
Doing 571 bit  ecdh's for 10s: 327 571-bit ECDH ops in 9.99s
Doing 163 bit  ecdh's for 10s: 4372 163-bit ECDH ops in 9.99s
Doing 233 bit  ecdh's for 10s: 2542 233-bit ECDH ops in 9.99s
Doing 283 bit  ecdh's for 10s: 1373 283-bit ECDH ops in 9.99s
Doing 409 bit  ecdh's for 10s: 677 409-bit ECDH ops in 9.99s
Doing 571 bit  ecdh's for 10s: 289 571-bit ECDH ops in 10.01s
ECDH failure.
3068867152:error:100AE081:elliptic curve routines:EC_GROUP_new_by_curve_name:unknown group:../crypto/ec/ec_curve.c:3100:
3068867152:error:100AE081:elliptic curve routines:EC_GROUP_new_by_curve_name:unknown group:../crypto/ec/ec_curve.c:3100:
OpenSSL 1.1.0f  25 May 2017
built on: reproducible build, date unspecified
options:bn(64,32) rc4(char) des(long) aes(partial) blowfish(ptr)
compiler: gcc -DDSO_DLFCN -DHAVE_DLFCN_H -DNDEBUG -DOPENSSL_THREADS -DOPENSSL_NO_STATIC_ENGINE -DOPENSSL_PIC -DOPENSSL_BN_ASM_MONT -DOPENSSL_BN_ASM_GF2m -DSHA1_ASM -DSHA256_ASM -DSHA512_ASM -DAES_ASM -DBSAES_ASM -DGHASH_ASM -DECP_NISTZ256_ASM
The 'numbers' are in 1000s of bytes per second processed.
type             16 bytes     64 bytes    256 bytes   1024 bytes   8192 bytes  16384 bytes
md2                  0.00         0.00         0.00         0.00         0.00         0.00
mdc2                 0.00         0.00         0.00         0.00         0.00         0.00
md4               7052.65k    25533.12k    78501.50k   165682.18k   245224.79k   253539.65k
md5              24504.50k    66415.23k   136936.03k   186457.77k   208865.96k   210457.94k
hmac(md5)         7836.10k    27284.16k    78377.64k   148938.23k   201834.50k   206531.24k
sha1             16526.11k    41352.52k    79481.32k   102816.09k   112655.07k   113535.66k
rmd160            5081.22k    15561.83k    37232.98k    56689.53k    67087.02k    67906.22k
rc4              83136.12k    95681.98k    99418.79k   100248.23k   100556.12k   100619.61k
des cbc          21961.37k    23569.50k    23955.11k    24069.80k    24044.48k    24100.86k
des ede3          8154.81k     8442.78k     8503.15k     8505.34k     8511.49k     8493.38k
idea cbc             0.00         0.00         0.00         0.00         0.00         0.00
seed cbc         27202.04k    30558.19k    31617.46k    31836.16k    31916.03k    31872.34k
rc2 cbc          17124.94k    18202.18k    18487.38k    18586.63k    18582.19k    18579.46k
rc5-32/12 cbc        0.00         0.00         0.00         0.00         0.00         0.00
blowfish cbc     37505.40k    43980.29k    45936.81k    46423.72k    46538.23k    46601.56k
cast cbc         32079.70k    37066.74k    38508.12k    38897.32k    38924.33k    38988.46k
aes-128 cbc      39515.88k    44081.56k    45384.18k    45885.10k    45995.35k    46110.82k
aes-192 cbc      34031.94k    37646.40k    38753.37k    38934.60k    39119.53k    39108.61k
aes-256 cbc      30474.49k    33327.40k    34200.49k    34398.21k    34439.28k    34482.86k
camellia-128 cbc    32553.49k    37364.80k    38918.57k    39289.17k    39390.09k    39425.37k
camellia-192 cbc    26512.55k    29634.34k    30581.67k    30824.79k    30847.40k    30883.84k
camellia-256 cbc    26481.38k    29639.68k    30638.39k    30828.20k    30902.95k    30833.70k
sha256           10644.35k    25031.81k    45542.57k    57200.64k    61918.32k    62149.97k
sha512            5787.15k    23221.97k    34700.33k    48525.65k    54938.28k    55711.12k
whirlpool         2055.16k     4235.41k     6906.95k     8224.77k     8705.37k     8756.40k
aes-128 ige      35864.52k    40890.46k    42303.49k    42685.10k    42732.65k    42834.02k
aes-192 ige      31574.12k    35484.07k    36810.14k    37071.19k    37161.64k    37020.17k
aes-256 ige      28483.69k    31659.65k    32667.75k    32880.98k    32959.15k    32987.18k
ghash            80678.19k    94261.93k    98370.90k    99270.46k   100131.45k   100095.83k
                  sign    verify    sign/s verify/s
rsa  512 bits 0.000583s -9.990000s   1715.4     -0.1
rsa 1024 bits 0.002340s -9.990000s    427.4     -0.1
rsa 2048 bits 0.013060s 0.000317s     76.6   3156.2
rsa 3072 bits 0.037074s -9.980000s     27.0     -0.1
rsa 4096 bits 0.081746s -9.990000s     12.2     -0.1
rsa 7680 bits 0.535000s -9.980000s      1.9     -0.1
rsa 15360 bits 7.606667s -9.990000s      0.1     -0.1
                  sign    verify    sign/s verify/s
dsa  512 bits 0.000535s -9.980000s   1869.4     -0.1
                              sign    verify    sign/s verify/s
 160 bit ecdsa (secp160r1)   0.0007s   0.0018s   1412.0    561.8
 192 bit ecdsa (nistp192)   0.0007s   0.0025s   1517.5    403.7
 224 bit ecdsa (nistp224)   0.0008s   0.0033s   1183.6    303.7
 256 bit ecdsa (nistp256)   0.0005s   0.0012s   2015.9    830.1
 384 bit ecdsa (nistp384)   0.0025s   0.0095s    402.7    104.8
 521 bit ecdsa (nistp521)   0.0055s   0.0209s    182.9     47.8
 163 bit ecdsa (nistk163)   0.0016s   0.0044s    626.8    224.7
 233 bit ecdsa (nistk233)   0.0031s   0.0075s    323.8    133.5
 283 bit ecdsa (nistk283)   0.0048s -10.0000s    209.0     -0.1
 409 bit ecdsa (nistk409)   0.0122s   0.0266s     82.3     37.6
 571 bit ecdsa (nistk571)   0.0294s -10.0100s     34.0     -0.1
 163 bit ecdsa (nistb163)   0.0016s   0.0047s    631.6    211.3
 233 bit ecdsa (nistb233)   0.0031s   0.0081s    326.3    123.1
 283 bit ecdsa (nistb283)   0.0048s   0.0148s    208.2     67.6
 409 bit ecdsa (nistb409)   0.0122s   0.0299s     82.0     33.5
 571 bit ecdsa (nistb571)   0.0294s   0.0700s     34.0     14.3
 253 bit ecdsa (X25519)   0.0000s   0.0000s      inf      inf
                              op      op/s
 160 bit ecdh (secp160r1)   0.0015s    667.0
 192 bit ecdh (nistp192)   0.0020s    495.1
 224 bit ecdh (nistp224)   0.0027s    375.9
 256 bit ecdh (nistp256)   0.0009s   1098.7
 384 bit ecdh (nistp384)   0.0081s    123.5
 521 bit ecdh (nistp521)   0.0179s     56.0
 163 bit ecdh (nistk163)   0.0022s    458.5
 233 bit ecdh (nistk233)   0.0035s    286.2
 283 bit ecdh (nistk283)   0.0066s    151.3
 409 bit ecdh (nistk409)   0.0132s     75.9
 571 bit ecdh (nistk571)   0.0306s     32.7
 163 bit ecdh (nistb163)   0.0023s    437.6
 233 bit ecdh (nistb233)   0.0039s    254.5
 283 bit ecdh (nistb283)   0.0073s    137.4
 409 bit ecdh (nistb409)   0.0148s     67.8
 571 bit ecdh (nistb571)   0.0346s     28.9
 253 bit ecdh (X25519)   0.0000s      inf
```
- hdparm
```
root@eldershade:~# hdparm -Tt /dev/mmcblk0p4

/dev/mmcblk0p4:
 Timing cached reads:   1714 MB in  2.00 seconds = 857.39 MB/sec
 Timing buffered disk reads: 148 MB in  3.01 seconds =  49.21 MB/sec
```

- iperf
```
root@eldershade:~# iperf -c invyl.home
------------------------------------------------------------
Client connecting to invyl.home, TCP port 5001
TCP window size: 20.7 KByte (default)
------------------------------------------------------------
[  3] local 192.168.143.190 port 37166 connected with 192.168.143.3 port 5001
[ ID] Interval       Transfer     Bandwidth
[  3]  0.0-10.0 sec   221 MBytes   185 Mbits/sec
```

## MT6589

### UMI-X2

- OpenSSL
```
Doing md4 for 3s on 16 size blocks: 1127963 md4's in 3.00s
Doing md4 for 3s on 64 size blocks: 1009641 md4's in 2.92s
Doing md4 for 3s on 256 size blocks: 788485 md4's in 3.00s
Doing md4 for 3s on 1024 size blocks: 413214 md4's in 2.99s
Doing md4 for 3s on 8192 size blocks: 74446 md4's in 2.94s
Doing md4 for 3s on 16384 size blocks: 39215 md4's in 2.99s
Doing md5 for 3s on 16 size blocks: 3882565 md5's in 2.99s
Doing md5 for 3s on 64 size blocks: 2580976 md5's in 2.93s
Doing md5 for 3s on 256 size blocks: 1359075 md5's in 2.98s
Doing md5 for 3s on 1024 size blocks: 461921 md5's in 2.98s
Doing md5 for 3s on 8192 size blocks: 64651 md5's in 3.00s
Doing md5 for 3s on 16384 size blocks: 31941 md5's in 2.92s
Doing hmac(md5) for 3s on 16 size blocks: 1243286 hmac(md5)'s in 2.98s
Doing hmac(md5) for 3s on 64 size blocks: 1081065 hmac(md5)'s in 3.00s
Doing hmac(md5) for 3s on 256 size blocks: 762393 hmac(md5)'s in 2.93s
Doing hmac(md5) for 3s on 1024 size blocks: 369629 hmac(md5)'s in 2.98s
Doing hmac(md5) for 3s on 8192 size blocks: 62450 hmac(md5)'s in 2.98s
Doing hmac(md5) for 3s on 16384 size blocks: 31362 hmac(md5)'s in 2.94s
Doing sha1 for 3s on 16 size blocks: 2621195 sha1's in 2.98s
Doing sha1 for 3s on 64 size blocks: 1634916 sha1's in 2.98s
Doing sha1 for 3s on 256 size blocks: 784472 sha1's in 2.99s
Doing sha1 for 3s on 1024 size blocks: 249638 sha1's in 2.94s
Doing sha1 for 3s on 8192 size blocks: 34918 sha1's in 2.98s
Doing sha1 for 3s on 16384 size blocks: 17571 sha1's in 2.99s
Doing sha256 for 3s on 16 size blocks: 1642549 sha256's in 2.93s
Doing sha256 for 3s on 64 size blocks: 993218 sha256's in 2.99s
Doing sha256 for 3s on 256 size blocks: 450971 sha256's in 2.98s
Doing sha256 for 3s on 1024 size blocks: 138762 sha256's in 2.92s
Doing sha256 for 3s on 8192 size blocks: 19136 sha256's in 3.00s
Doing sha256 for 3s on 16384 size blocks: 9619 sha256's in 2.99s
Doing sha512 for 3s on 16 size blocks: 919724 sha512's in 2.99s
Doing sha512 for 3s on 64 size blocks: 903141 sha512's in 2.93s
Doing sha512 for 3s on 256 size blocks: 344857 sha512's in 3.00s
Doing sha512 for 3s on 1024 size blocks: 120241 sha512's in 2.99s
Doing sha512 for 3s on 8192 size blocks: 16664 sha512's in 2.93s
Doing sha512 for 3s on 16384 size blocks: 8580 sha512's in 3.00s
Doing whirlpool for 3s on 16 size blocks: 325530 whirlpool's in 2.99s
Doing whirlpool for 3s on 64 size blocks: 164359 whirlpool's in 2.93s
Doing whirlpool for 3s on 256 size blocks: 68522 whirlpool's in 2.99s
Doing whirlpool for 3s on 1024 size blocks: 20363 whirlpool's in 3.00s
Doing whirlpool for 3s on 8192 size blocks: 2693 whirlpool's in 2.99s
Doing whirlpool for 3s on 16384 size blocks: 1324 whirlpool's in 2.93s
Doing rmd160 for 3s on 16 size blocks: 822556 rmd160's in 3.00s
Doing rmd160 for 3s on 64 size blocks: 628517 rmd160's in 2.99s
Doing rmd160 for 3s on 256 size blocks: 365404 rmd160's in 2.93s
Doing rmd160 for 3s on 1024 size blocks: 141059 rmd160's in 2.99s
Doing rmd160 for 3s on 8192 size blocks: 20768 rmd160's in 2.99s
Doing rmd160 for 3s on 16384 size blocks: 10291 rmd160's in 2.93s
Doing rc4 for 3s on 16 size blocks: 13186634 rc4's in 2.99s
Doing rc4 for 3s on 64 size blocks: 3792489 rc4's in 2.99s
Doing rc4 for 3s on 256 size blocks: 984916 rc4's in 2.99s
Doing rc4 for 3s on 1024 size blocks: 243396 rc4's in 2.93s
Doing rc4 for 3s on 8192 size blocks: 31163 rc4's in 2.99s
Doing rc4 for 3s on 16384 size blocks: 15576 rc4's in 2.99s
Doing des cbc for 3s on 16 size blocks: 3411174 des cbc's in 2.94s
Doing des cbc for 3s on 64 size blocks: 932575 des cbc's in 2.99s
Doing des cbc for 3s on 256 size blocks: 237344 des cbc's in 2.98s
Doing des cbc for 3s on 1024 size blocks: 58389 des cbc's in 2.93s
Doing des cbc for 3s on 8192 size blocks: 7459 des cbc's in 3.00s
Doing des cbc for 3s on 16384 size blocks: 3730 des cbc's in 2.99s
Doing des ede3 for 3s on 16 size blocks: 1292756 des ede3's in 2.99s
Doing des ede3 for 3s on 64 size blocks: 326819 des ede3's in 2.91s
Doing des ede3 for 3s on 256 size blocks: 84083 des ede3's in 3.00s
Doing des ede3 for 3s on 1024 size blocks: 21060 des ede3's in 2.99s
Doing des ede3 for 3s on 8192 size blocks: 2581 des ede3's in 2.93s
Doing des ede3 for 3s on 16384 size blocks: 1317 des ede3's in 3.00s
Doing aes-128 cbc for 3s on 16 size blocks: 6263844 aes-128 cbc's in 2.98s
Doing aes-128 cbc for 3s on 64 size blocks: 1711965 aes-128 cbc's in 2.93s
Doing aes-128 cbc for 3s on 256 size blocks: 450810 aes-128 cbc's in 2.98s
Doing aes-128 cbc for 3s on 1024 size blocks: 113690 aes-128 cbc's in 3.00s
Doing aes-128 cbc for 3s on 8192 size blocks: 14239 aes-128 cbc's in 2.99s
Doing aes-128 cbc for 3s on 16384 size blocks: 6973 aes-128 cbc's in 2.93s
Doing aes-192 cbc for 3s on 16 size blocks: 5403823 aes-192 cbc's in 2.99s
Doing aes-192 cbc for 3s on 64 size blocks: 1492227 aes-192 cbc's in 2.99s
Doing aes-192 cbc for 3s on 256 size blocks: 376009 aes-192 cbc's in 2.92s
Doing aes-192 cbc for 3s on 1024 size blocks: 96708 aes-192 cbc's in 2.99s
Doing aes-192 cbc for 3s on 8192 size blocks: 12109 aes-192 cbc's in 2.99s
Doing aes-192 cbc for 3s on 16384 size blocks: 5934 aes-192 cbc's in 2.92s
Doing aes-256 cbc for 3s on 16 size blocks: 4830778 aes-256 cbc's in 2.99s
Doing aes-256 cbc for 3s on 64 size blocks: 1321154 aes-256 cbc's in 2.99s
Doing aes-256 cbc for 3s on 256 size blocks: 338809 aes-256 cbc's in 2.99s
Doing aes-256 cbc for 3s on 1024 size blocks: 83556 aes-256 cbc's in 2.92s
Doing aes-256 cbc for 3s on 8192 size blocks: 10675 aes-256 cbc's in 2.99s
Doing aes-256 cbc for 3s on 16384 size blocks: 5339 aes-256 cbc's in 3.00s
Doing aes-128 ige for 3s on 16 size blocks: 5574638 aes-128 ige's in 2.93s
Doing aes-128 ige for 3s on 64 size blocks: 1618731 aes-128 ige's in 2.99s
Doing aes-128 ige for 3s on 256 size blocks: 419121 aes-128 ige's in 2.99s
Doing aes-128 ige for 3s on 1024 size blocks: 103625 aes-128 ige's in 2.94s
Doing aes-128 ige for 3s on 8192 size blocks: 13247 aes-128 ige's in 2.98s
Doing aes-128 ige for 3s on 16384 size blocks: 6612 aes-128 ige's in 2.98s
Doing aes-192 ige for 3s on 16 size blocks: 5008507 aes-192 ige's in 2.99s
Doing aes-192 ige for 3s on 64 size blocks: 1378715 aes-192 ige's in 2.94s
Doing aes-192 ige for 3s on 256 size blocks: 364092 aes-192 ige's in 2.99s
Doing aes-192 ige for 3s on 1024 size blocks: 91835 aes-192 ige's in 2.99s
Doing aes-192 ige for 3s on 8192 size blocks: 11268 aes-192 ige's in 2.93s
Doing aes-192 ige for 3s on 16384 size blocks: 5742 aes-192 ige's in 3.00s
Doing aes-256 ige for 3s on 16 size blocks: 4518099 aes-256 ige's in 2.99s
Doing aes-256 ige for 3s on 64 size blocks: 1229673 aes-256 ige's in 2.92s
Doing aes-256 ige for 3s on 256 size blocks: 323258 aes-256 ige's in 2.99s
Doing aes-256 ige for 3s on 1024 size blocks: 81468 aes-256 ige's in 2.99s
Doing aes-256 ige for 3s on 8192 size blocks: 10199 aes-256 ige's in 2.98s
Doing aes-256 ige for 3s on 16384 size blocks: 4990 aes-256 ige's in 2.93s
Doing ghash for 3s on 16 size blocks: 12862564 ghash's in 3.00s
Doing ghash for 3s on 64 size blocks: 3735317 ghash's in 2.99s
Doing ghash for 3s on 256 size blocks: 954964 ghash's in 2.93s
Doing ghash for 3s on 1024 size blocks: 246344 ghash's in 3.00s
Doing ghash for 3s on 8192 size blocks: 30891 ghash's in 2.98s
Doing ghash for 3s on 16384 size blocks: 15128 ghash's in 2.93s
Doing camellia-128 cbc for 3s on 16 size blocks: 5151431 camellia-128 cbc's in 2.98s
Doing camellia-128 cbc for 3s on 64 size blocks: 1480739 camellia-128 cbc's in 2.98s
Doing camellia-128 cbc for 3s on 256 size blocks: 385623 camellia-128 cbc's in 2.99s
Doing camellia-128 cbc for 3s on 1024 size blocks: 95378 camellia-128 cbc's in 2.92s
Doing camellia-128 cbc for 3s on 8192 size blocks: 12212 camellia-128 cbc's in 2.99s
Doing camellia-128 cbc for 3s on 16384 size blocks: 6104 camellia-128 cbc's in 3.00s
Doing camellia-192 cbc for 3s on 16 size blocks: 4117898 camellia-192 cbc's in 2.93s
Doing camellia-192 cbc for 3s on 64 size blocks: 1173854 camellia-192 cbc's in 2.99s
Doing camellia-192 cbc for 3s on 256 size blocks: 303017 camellia-192 cbc's in 2.99s
Doing camellia-192 cbc for 3s on 1024 size blocks: 74811 camellia-192 cbc's in 2.93s
Doing camellia-192 cbc for 3s on 8192 size blocks: 9566 camellia-192 cbc's in 2.99s
Doing camellia-192 cbc for 3s on 16384 size blocks: 4783 camellia-192 cbc's in 2.98s
Doing camellia-256 cbc for 3s on 16 size blocks: 4196792 camellia-256 cbc's in 2.99s
Doing camellia-256 cbc for 3s on 64 size blocks: 1149750 camellia-256 cbc's in 2.93s
Doing camellia-256 cbc for 3s on 256 size blocks: 302982 camellia-256 cbc's in 2.98s
Doing camellia-256 cbc for 3s on 1024 size blocks: 76348 camellia-256 cbc's in 2.98s
Doing camellia-256 cbc for 3s on 8192 size blocks: 9370 camellia-256 cbc's in 2.94s
Doing camellia-256 cbc for 3s on 16384 size blocks: 4782 camellia-256 cbc's in 2.99s
Doing seed cbc for 3s on 16 size blocks: 4312216 seed cbc's in 2.99s
Doing seed cbc for 3s on 64 size blocks: 1186179 seed cbc's in 2.93s
Doing seed cbc for 3s on 256 size blocks: 312700 seed cbc's in 3.00s
Doing seed cbc for 3s on 1024 size blocks: 78835 seed cbc's in 2.99s
Doing seed cbc for 3s on 8192 size blocks: 9878 seed cbc's in 2.99s
Doing seed cbc for 3s on 16384 size blocks: 4836 seed cbc's in 2.93s
Doing rc2 cbc for 3s on 16 size blocks: 2717917 rc2 cbc's in 2.98s
Doing rc2 cbc for 3s on 64 size blocks: 721128 rc2 cbc's in 2.99s
Doing rc2 cbc for 3s on 256 size blocks: 179429 rc2 cbc's in 2.92s
Doing rc2 cbc for 3s on 1024 size blocks: 45948 rc2 cbc's in 2.99s
Doing rc2 cbc for 3s on 8192 size blocks: 5751 rc2 cbc's in 2.98s
Doing rc2 cbc for 3s on 16384 size blocks: 2817 rc2 cbc's in 2.92s
Doing blowfish cbc for 3s on 16 size blocks: 5951363 blowfish cbc's in 3.00s
Doing blowfish cbc for 3s on 64 size blocks: 1742198 blowfish cbc's in 2.99s
Doing blowfish cbc for 3s on 256 size blocks: 455078 blowfish cbc's in 2.99s
Doing blowfish cbc for 3s on 1024 size blocks: 112626 blowfish cbc's in 2.93s
Doing blowfish cbc for 3s on 8192 size blocks: 14428 blowfish cbc's in 3.00s
Doing blowfish cbc for 3s on 16384 size blocks: 7212 blowfish cbc's in 2.98s
Doing cast cbc for 3s on 16 size blocks: 4987769 cast cbc's in 2.93s
Doing cast cbc for 3s on 64 size blocks: 1467360 cast cbc's in 2.98s
Doing cast cbc for 3s on 256 size blocks: 381603 cast cbc's in 3.00s
Doing cast cbc for 3s on 1024 size blocks: 94374 cast cbc's in 2.93s
Doing cast cbc for 3s on 8192 size blocks: 12077 cast cbc's in 2.98s
Doing cast cbc for 3s on 16384 size blocks: 6037 cast cbc's in 2.98s
Doing 512 bit private rsa's for 10s: 14770 512 bit private RSA's in 9.88s
Doing 512 bit public rsa's for 10s: RSA verify failure
3069174352:error:0407008A:rsa routines:RSA_padding_check_PKCS1_type_1:invalid padding:../crypto/rsa/rsa_pk1.c:67:
3069174352:error:04067072:rsa routines:rsa_ossl_public_decrypt:padding check failed:../crypto/rsa/rsa_ossl.c:576:
-1 512 bit public RSA's in 9.91s
Doing 1024 bit private rsa's for 10s: 3590 1024 bit private RSA's in 9.91s
Doing 1024 bit public rsa's for 10s: 83710 1024 bit public RSA's in 9.92s
Doing 2048 bit private rsa's for 10s: 646 2048 bit private RSA's in 9.90s
Doing 2048 bit public rsa's for 10s: RSA verify failure
3069174352:error:0407008A:rsa routines:RSA_padding_check_PKCS1_type_1:invalid padding:../crypto/rsa/rsa_pk1.c:67:
3069174352:error:04067072:rsa routines:rsa_ossl_public_decrypt:padding check failed:../crypto/rsa/rsa_ossl.c:576:
-1 2048 bit public RSA's in 9.89s
Doing 3072 bit private rsa's for 10s: 225 3072 bit private RSA's in 9.85s
Doing 3072 bit public rsa's for 10s: 12867 3072 bit public RSA's in 9.91s
Doing 4096 bit private rsa's for 10s: 105 4096 bit private RSA's in 10.30s
Doing 4096 bit public rsa's for 10s: RSA verify failure
3069174352:error:0407008A:rsa routines:RSA_padding_check_PKCS1_type_1:invalid padding:../crypto/rsa/rsa_pk1.c:67:
3069174352:error:04067072:rsa routines:rsa_ossl_public_decrypt:padding check failed:../crypto/rsa/rsa_ossl.c:576:
-1 4096 bit public RSA's in 9.91s
Doing 7680 bit private rsa's for 10s: 19 7680 bit private RSA's in 10.23s
Doing 7680 bit public rsa's for 10s: 2255 7680 bit public RSA's in 9.88s
Doing 15360 bit private rsa's for 10s: 3 15360 bit private RSA's in 26.92s
Doing 15360 bit public rsa's for 10s: RSA verify failure
3069174352:error:0407008A:rsa routines:RSA_padding_check_PKCS1_type_1:invalid padding:../crypto/rsa/rsa_pk1.c:67:
3069174352:error:04067072:rsa routines:rsa_ossl_public_decrypt:padding check failed:../crypto/rsa/rsa_ossl.c:576:
-1 15360 bit public RSA's in 9.91s
Doing 512 bit sign dsa's for 10s: 15604 512 bit DSA signs in 9.88s
Doing 512 bit verify dsa's for 10s: DSA verify failure
-1 512 bit DSA verify in 9.88s
Doing 1024 bit sign dsa's for 10s: 7137 1024 bit DSA signs in 9.87s
DSA verify failure.  No DSA verify will be done.
Doing 2048 bit sign dsa's for 10s: 2407 2048 bit DSA signs in 9.90s
DSA verify failure.  No DSA verify will be done.
Doing 160 bit sign ecdsa's for 10s: 11796 160 bit ECDSA signs in 9.82s
Doing 160 bit verify ecdsa's for 10s: 4618 160 bit ECDSA verify in 9.90s
Doing 192 bit sign ecdsa's for 10s: 12627 192 bit ECDSA signs in 9.86s
Doing 192 bit verify ecdsa's for 10s: 3332 192 bit ECDSA verify in 9.91s
Doing 224 bit sign ecdsa's for 10s: 9973 224 bit ECDSA signs in 9.88s
Doing 224 bit verify ecdsa's for 10s: 2600 224 bit ECDSA verify in 9.89s
Doing 256 bit sign ecdsa's for 10s: 16898 256 bit ECDSA signs in 9.84s
Doing 256 bit verify ecdsa's for 10s: 6970 256 bit ECDSA verify in 9.87s
Doing 384 bit sign ecdsa's for 10s: 3385 384 bit ECDSA signs in 9.92s
Doing 384 bit verify ecdsa's for 10s: 867 384 bit ECDSA verify in 9.91s
Doing 521 bit sign ecdsa's for 10s: 1538 521 bit ECDSA signs in 9.89s
Doing 521 bit verify ecdsa's for 10s: 397 521 bit ECDSA verify in 9.90s
Doing 163 bit sign ecdsa's for 10s: 5270 163 bit ECDSA signs in 9.90s
Doing 163 bit verify ecdsa's for 10s: 1879 163 bit ECDSA verify in 9.91s
Doing 233 bit sign ecdsa's for 10s: 2721 233 bit ECDSA signs in 9.90s
Doing 233 bit verify ecdsa's for 10s: 1126 233 bit ECDSA verify in 9.91s
Doing 283 bit sign ecdsa's for 10s: 1754 283 bit ECDSA signs in 9.92s
Doing 283 bit verify ecdsa's for 10s: 626 283 bit ECDSA verify in 9.93s
Doing 409 bit sign ecdsa's for 10s: 691 409 bit ECDSA signs in 9.90s
Doing 409 bit verify ecdsa's for 10s: 314 409 bit ECDSA verify in 9.93s
Doing 571 bit sign ecdsa's for 10s: 286 571 bit ECDSA signs in 9.94s
Doing 571 bit verify ecdsa's for 10s: 136 571 bit ECDSA verify in 9.90s
Doing 163 bit sign ecdsa's for 10s: 5310 163 bit ECDSA signs in 9.89s
Doing 163 bit verify ecdsa's for 10s: 1787 163 bit ECDSA verify in 9.91s
Doing 233 bit sign ecdsa's for 10s: ECDSA sign failure
3069174352:error:100B906B:elliptic curve routines:EC_POINT_set_affine_coordinates_GF2m:point is not on curve:../crypto/ec/ec_lib.c:733:
3069174352:error:100F8010:elliptic curve routines:ECDSA_sign_setup:EC lib:../crypto/ec/ecdsa_ossl.c:113:
3069174352:error:100F902A:elliptic curve routines:ossl_ecdsa_sign_sig:ECDSA lib:../crypto/ec/ecdsa_ossl.c:261:
-1 233 bit ECDSA signs in 9.90s
ECDSA verify failure.  No ECDSA verify will be done.
3069174352:error:0D07207B:asn1 encoding routines:ASN1_get_object:header too long:../crypto/asn1/asn1_lib.c:101:
3069174352:error:0D068066:asn1 encoding routines:asn1_check_tlen:bad object header:../crypto/asn1/tasn_dec.c:1100:
3069174352:error:0D07803A:asn1 encoding routines:asn1_item_embed_d2i:nested asn1 error:../crypto/asn1/tasn_dec.c:274:Type=ECDSA_SIG
Doing 160 bit  ecdh's for 10s: 5654 160-bit ECDH ops in 9.90s
Doing 192 bit  ecdh's for 10s: 4065 192-bit ECDH ops in 9.91s
Doing 224 bit  ecdh's for 10s: 3101 224-bit ECDH ops in 9.91s
Doing 256 bit  ecdh's for 10s: 9228 256-bit ECDH ops in 9.88s
Doing 384 bit  ecdh's for 10s: 1042 384-bit ECDH ops in 9.92s
Doing 521 bit  ecdh's for 10s: 471 521-bit ECDH ops in 9.92s
Doing 163 bit  ecdh's for 10s: 3847 163-bit ECDH ops in 9.90s
Doing 233 bit  ecdh's for 10s: 2295 233-bit ECDH ops in 9.89s
Doing 283 bit  ecdh's for 10s: 1300 283-bit ECDH ops in 9.91s
Doing 409 bit  ecdh's for 10s: 638 409-bit ECDH ops in 9.91s
Doing 571 bit  ecdh's for 10s: 275 571-bit ECDH ops in 9.91s
Doing 163 bit  ecdh's for 10s: 3658 163-bit ECDH ops in 9.90s
Doing 233 bit  ecdh's for 10s: 2140 233-bit ECDH ops in 9.91s
Doing 283 bit  ecdh's for 10s: 1168 283-bit ECDH ops in 9.92s
Doing 409 bit  ecdh's for 10s: 570 409-bit ECDH ops in 9.91s
Doing 571 bit  ecdh's for 10s: 243 571-bit ECDH ops in 9.95s
ECDH failure.
3069174352:error:100AE081:elliptic curve routines:EC_GROUP_new_by_curve_name:unknown group:../crypto/ec/ec_curve.c:3100:
3069174352:error:100AE081:elliptic curve routines:EC_GROUP_new_by_curve_name:unknown group:../crypto/ec/ec_curve.c:3100:
OpenSSL 1.1.0f  25 May 2017
built on: reproducible build, date unspecified
options:bn(64,32) rc4(char) des(long) aes(partial) blowfish(ptr)
compiler: gcc -DDSO_DLFCN -DHAVE_DLFCN_H -DNDEBUG -DOPENSSL_THREADS -DOPENSSL_NO_STATIC_ENGINE -DOPENSSL_PIC -DOPENSSL_BN_ASM_MONT -DOPENSSL_BN_ASM_GF2m -DSHA1_ASM -DSHA256_ASM -DSHA512_ASM -DAES_ASM -DBSAES_ASM -DGHASH_ASM -DECP_NISTZ256_ASM
The 'numbers' are in 1000s of bytes per second processed.
type             16 bytes     64 bytes    256 bytes   1024 bytes   8192 bytes  16384 bytes
md2                  0.00         0.00         0.00         0.00         0.00         0.00
mdc2                 0.00         0.00         0.00         0.00         0.00         0.00
md4               6015.80k    22129.12k    67284.05k   141515.43k   207435.93k   214882.46k
md5              20776.27k    56376.27k   116752.75k   158727.22k   176540.33k   179219.64k
hmac(md5)         6675.36k    23062.72k    66611.81k   127013.46k   171674.63k   174773.81k
sha1             14073.53k    35112.29k    67165.50k    86948.75k    95989.35k    96282.03k
rmd160            4386.97k    13453.21k    31926.08k    48309.17k    56900.15k    57545.31k
rc4              70563.93k    81177.02k    84327.26k    85063.99k    85380.37k    85350.23k
des cbc          18564.21k    19961.47k    20389.28k    20406.26k    20368.04k    20438.90k
des ede3          6917.76k     7187.77k     7175.08k     7212.52k     7216.23k     7192.58k
idea cbc             0.00         0.00         0.00         0.00         0.00         0.00
seed cbc         23075.40k    25909.71k    26683.73k    26999.01k    27063.74k    27041.99k
rc2 cbc          14592.84k    15435.52k    15730.76k    15736.04k    15809.46k    15806.07k
rc5-32/12 cbc        0.00         0.00         0.00         0.00         0.00         0.00
blowfish cbc     31740.60k    37291.19k    38963.20k    39361.44k    39398.06k    39651.48k
cast cbc         27236.96k    31513.77k    32563.46k    32982.59k    33199.59k    33191.34k
aes-128 cbc      33631.38k    37394.46k    38727.30k    38806.19k    39012.00k    38991.68k
aes-192 cbc      28916.78k    31940.64k    32965.17k    33120.06k    33176.23k    33295.43k
aes-256 cbc      25850.32k    28278.88k    29008.40k    29301.83k    29247.36k    29158.06k
camellia-128 cbc    27658.69k    31801.11k    33016.55k    33447.63k    33458.43k    33335.98k
camellia-192 cbc    22486.82k    25125.97k    25943.93k    26145.55k    26208.92k    26296.87k
camellia-256 cbc    22457.75k    25113.99k    26027.98k    26235.02k    26108.52k    26203.44k
sha256            8969.55k    21259.52k    38741.13k    48661.74k    52254.04k    52708.26k
sha512            4921.60k    19727.31k    29427.80k    41179.53k    46590.95k    46858.24k
whirlpool         1741.97k     3590.09k     5866.77k     6950.57k     7378.28k     7403.55k
aes-128 ige      30441.71k    34648.42k    35884.61k    36092.52k    36415.91k    36352.69k
aes-192 ige      26801.38k    30012.84k    31173.09k    31451.18k    31504.25k    31358.98k
aes-256 ige      24177.12k    26951.74k    27676.94k    27900.75k    28036.98k    27903.13k
ghash            68600.34k    79953.27k    83437.13k    84085.42k    84919.15k    84592.88k
                  sign    verify    sign/s verify/s
rsa  512 bits 0.000669s -9.910000s   1494.9     -0.1
rsa 1024 bits 0.002760s 0.000119s    362.3   8438.5
rsa 2048 bits 0.015325s -9.890000s     65.3     -0.1
rsa 3072 bits 0.043778s 0.000770s     22.8   1298.4
rsa 4096 bits 0.098095s -9.910000s     10.2     -0.1
rsa 7680 bits 0.538421s 0.004381s      1.9    228.2
rsa 15360 bits 8.973333s -9.910000s      0.1     -0.1
                  sign    verify    sign/s verify/s
dsa  512 bits 0.000633s -9.880000s   1579.4     -0.1
                              sign    verify    sign/s verify/s
 160 bit ecdsa (secp160r1)   0.0008s   0.0021s   1201.2    466.5
 192 bit ecdsa (nistp192)   0.0008s   0.0030s   1280.6    336.2
 224 bit ecdsa (nistp224)   0.0010s   0.0038s   1009.4    262.9
 256 bit ecdsa (nistp256)   0.0006s   0.0014s   1717.3    706.2
 384 bit ecdsa (nistp384)   0.0029s   0.0114s    341.2     87.5
 521 bit ecdsa (nistp521)   0.0064s   0.0249s    155.5     40.1
 163 bit ecdsa (nistk163)   0.0019s   0.0053s    532.3    189.6
 233 bit ecdsa (nistk233)   0.0036s   0.0088s    274.8    113.6
 283 bit ecdsa (nistk283)   0.0057s   0.0159s    176.8     63.0
 409 bit ecdsa (nistk409)   0.0143s   0.0316s     69.8     31.6
 571 bit ecdsa (nistk571)   0.0348s   0.0728s     28.8     13.7
 163 bit ecdsa (nistb163)   0.0019s   0.0055s    536.9    180.3
                              op      op/s
 160 bit ecdh (secp160r1)   0.0018s    571.1
 192 bit ecdh (nistp192)   0.0024s    410.2
 224 bit ecdh (nistp224)   0.0032s    312.9
 256 bit ecdh (nistp256)   0.0011s    934.0
 384 bit ecdh (nistp384)   0.0095s    105.0
 521 bit ecdh (nistp521)   0.0211s     47.5
 163 bit ecdh (nistk163)   0.0026s    388.6
 233 bit ecdh (nistk233)   0.0043s    232.1
 283 bit ecdh (nistk283)   0.0076s    131.2
 409 bit ecdh (nistk409)   0.0155s     64.4
 571 bit ecdh (nistk571)   0.0360s     27.7
 163 bit ecdh (nistb163)   0.0027s    369.5
 233 bit ecdh (nistb233)   0.0046s    215.9
 283 bit ecdh (nistb283)   0.0085s    117.7
 409 bit ecdh (nistb409)   0.0174s     57.5
 571 bit ecdh (nistb571)   0.0409s     24.4
 253 bit ecdh (X25519)   0.0000s      inf
```

- hdparm

```
/dev/mmcblk0p4:
 Timing cached reads:   636 MB in  2.00 seconds = 317.97 MB/sec
 Timing buffered disk reads: 182 MB in  3.02 seconds =  60.26 MB/sec
```

- iperf (cdc_eem)

```
root@eldershade:/# iperf -c invyl.home
------------------------------------------------------------
Client connecting to invyl.home, TCP port 5001
TCP window size: 20.7 KByte (default)
------------------------------------------------------------
[  3] local 192.168.143.160 port 44537 connected with 192.168.143.3 port 5001
[ ID] Interval       Transfer     Bandwidth
[  3]  0.0-10.0 sec  40.1 MBytes  33.7 Mbits/sec
```
