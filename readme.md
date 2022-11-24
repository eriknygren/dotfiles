# E N V

My setup, easiest managed with GNU stow

eg, copy nvim config by checking out repo, and typing `stow neovim`

## HeyFocus pomodoro setup/usage

First of all in `HeyFocus > Preferences > Scripting > Unfocus` add:
```bash
# Helper function to format the interval
convertsecs() {
    ((h=${1}/3600))
    ((m=(${1}%3600)/60))
    ((s=${1}%60))
    printf "%02d:%02d:%02d\n" $h $m $s
}

# Write out the session to our file
echo $(date '+%a %b %d %Y %H:%M') - Focused for $(convertsecs $FOCUS_ACTUAL_INTERVAL) >> ~/focus-sessions.txt
```

(And create `~/focus-sessions.txt`)

DJ Khaled quotes will assist with the deep work. How you say?

To start a new pomodoro session use the command `pdstart`

![image](https://user-images.githubusercontent.com/5814512/33393201-5037adc6-d536-11e7-9aee-9f9eb72cf771.png)

See how you're doing on your daily goal with `pdcount`

![image](https://user-images.githubusercontent.com/5814512/33393213-5b7d2080-d536-11e7-8c26-ee864bcbe3cb.png)

Struggling to finish?, use `motivate` during your pomodoro session

![image](https://user-images.githubusercontent.com/5814512/33393233-73b318e4-d536-11e7-9f76-1d92ab633ef0.png)
