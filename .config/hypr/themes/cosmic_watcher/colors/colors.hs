--Place this file in your .xmonad/lib directory and import module Colors into .xmonad/xmonad.hs config
--The easy way is to create a soft link from this file to the file in .xmonad/lib using ln -s
--Then recompile and restart xmonad.

module Colors
    ( wallpaper
    , background, foreground, cursor
    , color0, color1, color2, color3, color4, color5, color6, color7
    , color8, color9, color10, color11, color12, color13, color14, color15
    ) where

-- Shell variables
-- Generated by 'wal'
wallpaper="/home/rmoses/dotfiles/.config/hypr/themes/cosmic_watcher/watcher_of_the_cosmic_gate.jpg"

-- Special
background="#0c090a"
foreground="#cac1ca"
cursor="#cac1ca"

-- Colors
color0="#0c090a"
color1="#614D65"
color2="#6B536E"
color3="#85647A"
color4="#775187"
color5="#8D6F92"
color6="#A252B0"
color7="#cac1ca"
color8="#8d878d"
color9="#614D65"
color10="#6B536E"
color11="#85647A"
color12="#775187"
color13="#8D6F92"
color14="#A252B0"
color15="#cac1ca"
