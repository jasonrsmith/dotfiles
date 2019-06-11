if [ -x "$(command -v xset)" ]; then
  xset r rate 220 100
fi
if [ -x "$(command -v setxkbmap)" ]; then
  setxkbmap -option ctrl:swapcaps
fi
