#!/bin/bash

# Проверяем, что играет
STATUS=$(playerctl status 2>/dev/null)
if [ -z "$STATUS" ]; then
    echo "󰝛 Нет активного плеера" | wofi --show dmenu --prompt "󰎆"
    exit
fi

# Получаем информацию
ARTIST=$(playerctl metadata artist 2>/dev/null)
TITLE=$(playerctl metadata title 2>/dev/null)

# Определяем иконку статуса
case "$STATUS" in
    "Playing") STATUS_ICON="󰐊" ;;
    "Paused") STATUS_ICON="󰏤" ;;
    *) STATUS_ICON="󰝛" ;;
esac

# Создаём меню
MENU=$(echo -e "󰎆 Сейчас: ${TITLE:0:40} - ${ARTIST:0:20}\n━━━━━━━━━━━━━━━━━━━━━━\n${STATUS_ICON} Play/Pause\n󰒭 Next\n󰒮 Previous\n󰝝 Volume +5%\n󰝞 Volume -5%\n󰓇 Выбрать плеер\n󰗼 Остановить всё")

CHOICE=$(echo "$MENU" | wofi --show dmenu --prompt "󰎆 󰎆 󰎆")

case "$CHOICE" in
    "󰐊 Play/Pause"|"󰏤 Play/Pause") 
        playerctl play-pause 
        ;;
    "󰒭 Next") 
        playerctl next 
        ;;
    "󰒮 Previous") 
        playerctl previous 
        ;;
    "󰝝 Volume +5%") 
        playerctl volume 0.05+ 
        ;;
    "󰝞 Volume -5%") 
        playerctl volume 0.05- 
        ;;
    "󰓇 Выбрать плеер") 
        PLAYER=$(playerctl -l | wofi --show dmenu --prompt "󰓇 Выбери плеер")
        [ -n "$PLAYER" ] && playerctl --player="$PLAYER" play-pause 
        ;;
    "󰗼 Остановить всё") 
        killall -STOP $(playerctl -l) 2>/dev/null 
        ;;
esac
