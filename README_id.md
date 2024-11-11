<!--
N.B.: README ini dibuat secara otomatis oleh <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
Ini TIDAK boleh diedit dengan tangan.
-->

# mygpo (gPodder.net) untuk YunoHost

[![Tingkat integrasi](https://dash.yunohost.org/integration/mygpo.svg)](https://ci-apps.yunohost.org/ci/apps/mygpo/) ![Status kerja](https://ci-apps.yunohost.org/ci/badges/mygpo.status.svg) ![Status pemeliharaan](https://ci-apps.yunohost.org/ci/badges/mygpo.maintain.svg)

[![Pasang mygpo (gPodder.net) dengan YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=mygpo)

*[Baca README ini dengan bahasa yang lain.](./ALL_README.md)*

> *Paket ini memperbolehkan Anda untuk memasang mygpo (gPodder.net) secara cepat dan mudah pada server YunoHost.*  
> *Bila Anda tidak mempunyai YunoHost, silakan berkonsultasi dengan [panduan](https://yunohost.org/install) untuk mempelajari bagaimana untuk memasangnya.*

## Ringkasan

This is the webservice powering the https://gpodder.net website. It can be used to sync podcast subscriptions with [supported clients](https://gpoddernet.readthedocs.io/en/latest/user/clients.html).


**Versi terkirim:** 2024.11.08~ynh1

**Demo:** <https://gpodder.net>

## Tangkapan Layar

![Tangkapan Layar pada mygpo (gPodder.net)](./doc/screenshots/screenshot1.png)

## Dokumentasi dan sumber daya

- Website aplikasi resmi: <https://gpodder.net>
- Dokumentasi admin resmi: <https://gpoddernet.readthedocs.io/>
- Depot kode aplikasi hulu: <https://github.com/gpodder/mygpo>
- Gudang YunoHost: <https://apps.yunohost.org/app/mygpo>
- Laporkan bug: <https://github.com/YunoHost-Apps/mygpo_ynh/issues>

## Info developer

Silakan kirim pull request ke [`testing` branch](https://github.com/YunoHost-Apps/mygpo_ynh/tree/testing).

Untuk mencoba branch `testing`, silakan dilanjutkan seperti:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/mygpo_ynh/tree/testing --debug
atau
sudo yunohost app upgrade mygpo -u https://github.com/YunoHost-Apps/mygpo_ynh/tree/testing --debug
```

**Info lebih lanjut mengenai pemaketan aplikasi:** <https://yunohost.org/packaging_apps>
