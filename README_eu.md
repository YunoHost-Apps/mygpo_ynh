<!--
Ohart ongi: README hau automatikoki sortu da <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>ri esker
EZ editatu eskuz.
-->

# mygpo (gPodder.net) YunoHost-erako

[![Integrazio maila](https://dash.yunohost.org/integration/mygpo.svg)](https://dash.yunohost.org/appci/app/mygpo) ![Funtzionamendu egoera](https://ci-apps.yunohost.org/ci/badges/mygpo.status.svg) ![Mantentze egoera](https://ci-apps.yunohost.org/ci/badges/mygpo.maintain.svg)

[![Instalatu mygpo (gPodder.net) YunoHost-ekin](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=mygpo)

*[Irakurri README hau beste hizkuntzatan.](./ALL_README.md)*

> *Pakete honek mygpo (gPodder.net) YunoHost zerbitzari batean azkar eta zailtasunik gabe instalatzea ahalbidetzen dizu.*  
> *YunoHost ez baduzu, kontsultatu [gida](https://yunohost.org/install) nola instalatu ikasteko.*

## Aurreikuspena

This is the webservice powering the https://gpodder.net website. It can be used to sync podcast subscriptions with [supported clients](https://gpoddernet.readthedocs.io/en/latest/user/clients.html).


**Paketatutako bertsioa:** 2.11.20221222~ynh2

**Demoa:** <https://gpodder.net>

## Pantaila-argazkiak

![mygpo (gPodder.net)(r)en pantaila-argazkia](./doc/screenshots/screenshot1.png)

## Dokumentazioa eta baliabideak

- Aplikazioaren webgune ofiziala: <https://gpodder.net>
- Administratzaileen dokumentazio ofiziala: <https://gpoddernet.readthedocs.io/>
- Jatorrizko aplikazioaren kode-gordailua: <https://github.com/gpodder/mygpo>
- YunoHost Denda: <https://apps.yunohost.org/app/mygpo>
- Eman errore baten berri: <https://github.com/YunoHost-Apps/mygpo_ynh/issues>

## Garatzaileentzako informazioa

Bidali `pull request`a [`testing` abarrera](https://github.com/YunoHost-Apps/mygpo_ynh/tree/testing).

`testing` abarra probatzeko, ondorengoa egin:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/mygpo_ynh/tree/testing --debug
edo
sudo yunohost app upgrade mygpo -u https://github.com/YunoHost-Apps/mygpo_ynh/tree/testing --debug
```

**Informazio gehiago aplikazioaren paketatzeari buruz:** <https://yunohost.org/packaging_apps>
