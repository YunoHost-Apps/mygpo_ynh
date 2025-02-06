<!--
Важно: этот README был автоматически сгенерирован <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
Он НЕ ДОЛЖЕН редактироваться вручную.
-->

# mygpo (gPodder.net) для YunoHost

[![Уровень интеграции](https://apps.yunohost.org/badge/integration/mygpo)](https://ci-apps.yunohost.org/ci/apps/mygpo/)
![Состояние работы](https://apps.yunohost.org/badge/state/mygpo)
![Состояние сопровождения](https://apps.yunohost.org/badge/maintained/mygpo)

[![Установите mygpo (gPodder.net) с YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=mygpo)

*[Прочтите этот README на других языках.](./ALL_README.md)*

> *Этот пакет позволяет Вам установить mygpo (gPodder.net) быстро и просто на YunoHost-сервер.*  
> *Если у Вас нет YunoHost, пожалуйста, посмотрите [инструкцию](https://yunohost.org/install), чтобы узнать, как установить его.*

## Обзор

This is the webservice powering the https://gpodder.net website. It can be used to sync podcast subscriptions with [supported clients](https://gpoddernet.readthedocs.io/en/latest/user/clients.html).


**Поставляемая версия:** 2025.02.02~ynh1

**Демо-версия:** <https://gpodder.net>

## Снимки экрана

![Снимок экрана mygpo (gPodder.net)](./doc/screenshots/screenshot1.png)

## Документация и ресурсы

- Официальный веб-сайт приложения: <https://gpodder.net>
- Официальная документация администратора: <https://gpoddernet.readthedocs.io/>
- Репозиторий кода главной ветки приложения: <https://github.com/gpodder/mygpo>
- Магазин YunoHost: <https://apps.yunohost.org/app/mygpo>
- Сообщите об ошибке: <https://github.com/YunoHost-Apps/mygpo_ynh/issues>

## Информация для разработчиков

Пришлите Ваш запрос на слияние в [ветку `testing`](https://github.com/YunoHost-Apps/mygpo_ynh/tree/testing).

Чтобы попробовать ветку `testing`, пожалуйста, сделайте что-то вроде этого:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/mygpo_ynh/tree/testing --debug
или
sudo yunohost app upgrade mygpo -u https://github.com/YunoHost-Apps/mygpo_ynh/tree/testing --debug
```

**Больше информации о пакетировании приложений:** <https://yunohost.org/packaging_apps>
