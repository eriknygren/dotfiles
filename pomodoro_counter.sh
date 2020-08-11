#!/bin/bash
source ~/dotfiles/quote_picker.sh

pomodoros=$(grep -o "^$(date '+%a %b %d %Y')" ~/focus-sessions.txt | wc -l | sed -e 's/^[ \t]*//')
echo "You've done $pomodoros pomodoros today. Remember: $selectedexpression"
