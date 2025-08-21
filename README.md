# WPS-Linux-Russian-MUI

Русский интерфейс и проверка орфографии для WPS Linux

Пакеты взяты из Windows версии WPS

Текущая версия: 12.2.0.21931

Описание:
 - mui - Основные файлы перевода интерфейса
 - addons - Файлы перевода компонентов WPS
 - dicts - Файлы проверки орфографии
 - dicts-oat - Алтернативные файлы проверки орфографии из LibreOffice от [AOT](https://extensions.libreoffice.org/en/extensions/show/russian-dictionary-pack) (сгенерированы [скриптом](https://gist.github.com/SnakeSel/baefccc3960454b82ef88f5f9fa186d5))

## Установка
Скачайте [архив](https://github.com/SnakeSel/WPS-Linux-Russian-MUI/archive/refs/heads/main.zip) репозитория 
или выполните: 
```sh 
git clone https://github.com/SnakeSel/WPS-Linux-Russian-MUI
```
Далее воспользуйтесь одним из способов установки:

### Установка скриптом
1. Перейдите в каталог репозитория
2. Запустите от root скрипт `installWPSmui.sh`

### Установка в ручном режиме
В разных дистрибутивах путь к WPS отличается:
 - Arch: `/usr/lib/office6` или `/opt/kingsoft/wps-office/office6` (для wps 12: wps-office-bin )
 - Debian: `/opt/Kingsoft/WPS Office/office6`

**Замените далее в командах `{WPS DIR}` на путь до WPS  в вашем дистрибутиве!**
1. Перейдите в каталог репозитория
2. Копируем файлы интерфейса
```sh 
sudo cp -r mui/ {WPS DIR}
sudo cp -r addons/ {WPS DIR}
```
3. Копируем проверку орфографии на выбор

Для файлов проверки из WPS:
```sh 
sudo cp -r dicts/ {WPS DIR}
```
Для файлов проверки из LibreOffice от AOT:
```sh 
sudo cp -r dicts-oat/* {WPS DIR}/dicts
```

## Установка шрифтов
 - В ручном режиме: [WPS Office Fonts](https://github.com/ferion11/ttf-wps-fonts)
 - Arch: Пакет **ttf-wps-fonts** из AUR
 - Debian: **ttf-mscorefonts-installer** (требует contrib)

## Выбор языка проверки орфографии в WPS
    1. В WPS перейдите на вкладку "Рецензирование";
    2. Слева нажмите на "Проверка правописания";
    3. Выберите "Выбрать язык";
    4. Дважды щелкните левой кнопкой мыши по нужному языку.
