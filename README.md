# Hyprland Dotfiles

Fonts

```sudo pacman -S ttf-font-awesome ttf-jetbrains-mono-nerd```

Programs

```sudo pacman -S waybar wofi pulseaudio pavucontrol lm_sensors brightnessctl```



# Wofi 1, Waybar 1


<img width="1920" height="1080" alt="2026-04-29-172908_hyprshot" src="https://github.com/user-attachments/assets/5eae85a8-3150-4141-a434-b7dcc8e14b0b" />


# Wofi 2, Waybar 2

<img width="1920" height="1080" alt="2026-05-02-072710_hyprshot" src="https://github.com/user-attachments/assets/8c7da1c4-b4d5-47c1-b83d-d7fea25db12a" />


# Cava-vusual in Waybar + Wofi-music

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/dc06e205-70c6-4df1-8dd6-5665de40fc63" />


```
sudo pacman -S cava

mkdir -p ~/.local/bin/

nvim ~/.local/bin/wofi-music.sh

chmod +x ~/.local/bin/wofi-music.sh

sudo pacman -S playerctl

nvim ~/.local/bin/cava_waybar.sh

chmod +x ~/.local/bin/cava_waybar.sh

nvim ~/.config/waybar/config

nvim ~/.config/waybar/style.css

```

Start

```
~/.local/bin/wofi-music.sh

killall waybar && waybar &
```

~/.config/hypr/hyprland.conf

```
bind = $mainMod SHIFT, M, exec, ~/.local/bin/wofi-music.sh
```


