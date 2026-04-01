# !/bin/sh

# pmset(macOS専用)でバッテリー情報を取得する。Linux等の非対応環境では --% と表示する。
battery_info=$(/usr/bin/pmset -g ps 2>/dev/null | awk '{ if (NR == 2) print $2 " " $3 }' | sed -e "s/;//g" -e "s/%//")
if [[ -n "$battery_info" ]]; then
  battery_quantity=$(echo $battery_info | awk '{print $2}')
  if [[ ! $battery_info =~ "discharging" ]]; then
    battery="#[fg=black]⚡$battery_quantity%#[default]"
  elif (( $battery_quantity < 16 )); then
    battery="#[bg=red,fg=white]$battery_quantity%#[default]"
  else
    battery="#[fg=black]$battery_quantity%#[default]"
  fi
else
  battery="--%"
fi
echo "[charge:$battery]"

