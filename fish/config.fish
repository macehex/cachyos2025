# Obsidian 
alias oo='z $HOME/Onedrive/SCHOOL/Current_notes'

set -gx PATH $HOME/go/bin $PATH
set -gx PATH $HOME/.cargo/bin $PATH

set -gx PATH $HOME/.spicetify/spicetify $PATH
set PATH "$PATH:/home/mace/worldbanc/private/bin"
source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch

#function fish_greeting
#    # smth smth
starship init fish | source
#end

# Generated for envman. Do not edit.
test -s ~/.config/envman/load.fish; and source ~/.config/envman/load.fish
zoxide init fish | source

fish_add_path /home/mace/.spicetify
