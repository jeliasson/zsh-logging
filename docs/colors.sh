#!/bin/zsh

# This script will simply print a table of available colors
# https://askubuntu.com/questions/27314/script-to-display-all-terminal-colors
for x in {0..8}; do for i in {30..37}; do for a in {40..47}; do echo -ne "\e[$x;$i;$a""m\\\e[$x;$i;$a""m\e[0;37;40m "; done; echo; done; done; echo ""