<!--
Nota bene : ce README est automatiquement généré par <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
Il NE doit PAS être modifié à la main.
-->

# mygpo (gPodder.net) pour YunoHost

[![Niveau d’intégration](https://apps.yunohost.org/badge/integration/mygpo)](https://ci-apps.yunohost.org/ci/apps/mygpo/)
![Statut du fonctionnement](https://apps.yunohost.org/badge/state/mygpo)
![Statut de maintenance](https://apps.yunohost.org/badge/maintained/mygpo)

[![Installer mygpo (gPodder.net) avec YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=mygpo)

*[Lire le README dans d'autres langues.](./ALL_README.md)*

> *Ce package vous permet d’installer mygpo (gPodder.net) rapidement et simplement sur un serveur YunoHost.*  
> *Si vous n’avez pas YunoHost, consultez [ce guide](https://yunohost.org/install) pour savoir comment l’installer et en profiter.*

## Vue d’ensemble

This is the webservice powering the https://gpodder.net website. It can be used to sync podcast subscriptions with [supported clients](https://gpoddernet.readthedocs.io/en/latest/user/clients.html).


**Version incluse :** 2024.12.25~ynh1

**Démo :** <https://gpodder.net>

## Captures d’écran

![Capture d’écran de mygpo (gPodder.net)](./doc/screenshots/screenshot1.png)

## Documentations et ressources

- Site officiel de l’app : <https://gpodder.net>
- Documentation officielle de l’admin : <https://gpoddernet.readthedocs.io/>
- Dépôt de code officiel de l’app : <https://github.com/gpodder/mygpo>
- YunoHost Store : <https://apps.yunohost.org/app/mygpo>
- Signaler un bug : <https://github.com/YunoHost-Apps/mygpo_ynh/issues>

## Informations pour les développeurs

Merci de faire vos pull request sur la [branche `testing`](https://github.com/YunoHost-Apps/mygpo_ynh/tree/testing).

Pour essayer la branche `testing`, procédez comme suit :

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/mygpo_ynh/tree/testing --debug
ou
sudo yunohost app upgrade mygpo -u https://github.com/YunoHost-Apps/mygpo_ynh/tree/testing --debug
```

**Plus d’infos sur le packaging d’applications :** <https://yunohost.org/packaging_apps>
