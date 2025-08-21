#!/bin/bash
#
# Install WPS MUI
#
baseDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)
# echo """

WPSdirs=("/usr/lib/office6" "/opt/Kingsoft/WPS Office/office6" "/opt/kingsoft/wps-office/office6" )

MUIfolder=("mui/ru_RU" "addons")

# Цвета
ClrRed=$(tput setaf 1)
ClrGreen=$(tput setaf 2)
ClrYellow=$(tput setaf 3)
ClrMagenta=$(tput setaf 5)
ClrReset=$(tput sgr0) #сброс цвета на стандартный

err(){
    echo "${ClrRed}[ERR] ${1}${ClrReset}"
    exit 1
}

wrn(){
    echo "${ClrYellow}[WRN] ${1}${ClrReset}"
}
###############################################

# Проверка на запуск от root
if [[ $(id -u) -ne 0 ]] ; then err "Please run as root"; fi

# Ищем директорию с WPS
for d in "${WPSdirs[@]}"; do

    if [[ -d "${d}" ]];then
        WPSdir=${d}
        break
    fi

done

# Если переменная пуста - выход
if [[ -z "${WPSdir}" ]];then
    err "Директория WPS не найдена"
fi

# Проверяем, что файлы MUI доступны
for d in "${MUIfolder[@]}"; do

    if ! [[ -d "${d}" ]];then
        err "Директория ${d} не найдена!"
    fi

done

echo "${ClrGreen}Установка MUI WPS${ClrReset}"
echo "${ClrMagenta}В директорию: ${WPSdir}${ClrReset}"

while true; do
    read -r -p "Продолжаем установку? (y\n):" yn
        case $yn in
                [YyДд]* ) break;;
                [NnНн]* ) exit;;
                * ) echo "Please answer yes or no.";;
    esac
done

echo "Копируем файлы интерфейса..."
cp -rf "${baseDIR}/mui/" "${WPSdir}" || wrn "mui не скопирован!"
cp -rf "${baseDIR}/addons/" "${WPSdir}" || wrn "addons не скопирован!"

echo ""
echo ""
echo "${ClrYellow}Установить файлы проверки правописания?${ClrReset}"
PS3='Выберите действие: '
select opt in "WPS" "LibreOffice (AOT)" "Нет"
do
    case $opt in
        "WPS")
            echo "Устанавливаем проверку правописания от WPS..."
            cp -rf "${baseDIR}/dicts/" "${WPSdir}" || wrn "dicts не скопирован!"
            break;;
        "LibreOffice (AOT)")
            echo "Устанавливаем проверку правописания от LibreOffice (AOT)..."
            cp -rf "${baseDIR}"/dicts-oat/* "${WPSdir}/dicts/" || wrn "dicts-oat не скопирован!"
            break;;
        "Нет")
            break
            ;;
        *) echo invalid option;;
    esac
done

echo ""
echo "${ClrGreen}Установка MUI WPS завершена!${ClrReset}"
read -r -p "Нажмите любую клавишу..."

exit 0
