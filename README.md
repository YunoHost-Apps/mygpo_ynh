# `mygpo` (gPodder.net) for YunoHost

[![Integration level](https://dash.yunohost.org/integration/mygpo.svg)](https://dash.yunohost.org/appci/app/mygpo) ![](https://ci-apps.yunohost.org/ci/badges/mygpo.status.svg) ![](https://ci-apps.yunohost.org/ci/badges/mygpo.maintain.svg)  
[![Install mygpo with YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=mygpo)

*[Lire ce readme en français.](./README_fr.md)*

> *This package allows you to install mygpo quickly and simply on a YunoHost server.
> If you don't have YunoHost, please consult [the guide](https://yunohost.org/#/install) to learn how to install it.*

## Overview

This is the webservice powering the https://gpodder.net website. It can be used to sync podcast subscriptions with [supported clients](https://gpoddernet.readthedocs.io/en/latest/user/clients.html).

**Shipped version:** f9a89d37ad53eb688c7d7256f32fe230f95b9046

## Screenshots

![](https://github.com/YunoHost-Apps/mygpo_ynh/raw/master/screenshot.png)

## Demo

* [Official demo](https://gpodder.net)

## Configuration

Edit files under `/opt/yunohost/APPDIR/envs/prod` to set environment variables.

## Documentation

* Official documentation: https://gpoddernet.readthedocs.io/

#### Multi-user support

* Are LDAP and HTTP auth supported? **No**
* Can the app be used by multiple users? **Yes**

#### Supported architectures

* x86-64 - [![Build Status](https://ci-apps.yunohost.org/ci/logs/mygpo%20%28Apps%29.svg)](https://ci-apps.yunohost.org/ci/apps/mygpo/)
* ARMv8-A - [![Build Status](https://ci-apps-arm.yunohost.org/ci/logs/mygpo%20%28Apps%29.svg)](https://ci-apps-arm.yunohost.org/ci/apps/mygpo/)

## Limitations

* The feed-parsing service is not included, https://feeds.gpodder.net is used

## Links

* Report a bug: https://github.com/YunoHost-Apps/mygpo_ynh/issues
* App website: https://gpodder.net
* Upstream app repository: https://github.com/gpodder/mygpo
* YunoHost website: https://yunohost.org/

---

## Developer info

Please send your pull request to the [testing branch](https://github.com/YunoHost-Apps/mygpo_ynh/tree/testing).

To try the testing branch, please proceed like that.
```
sudo yunohost app install https://github.com/YunoHost-Apps/mygpo_ynh/tree/testing --debug
or
sudo yunohost app upgrade mygpo -u https://github.com/YunoHost-Apps/mygpo_ynh/tree/testing --debuggit 
```
