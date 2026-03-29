# !/bin/sh

if battery_info=$(/usr/bin/pmset -g ps | awk '{ if (NR == 2) print $2 " " $3 }' | sed -e "s/;//g" -e "s/%//") ; then
  battery_quantity=$(echo $battery_info | awk '{print $2}')
  if [[ ! $battery_info =~ "discharging" ]]; then
    battery="#[fg=black]⚡$battery_quantity%#[default]"
  elif (( $battery_quantity < 16 )); then
    battery="#[bg=red,fg=white]$battery_quantity%#[default]"
  else
    battery="#[fg=black]$battery_quantity%#[default]"
  fi
  echo "[charge:$battery]"
fi

