# Change this according to your device
# ################
# # Variables
# ################
#
# # Date and time
date_and_week=$(date "+%Y/%m/%d (v%-V)")
current_time=$(date "+%H:%M")

# Battery
battery_charge=$(upower --show-info $(upower --enumerate | grep 'BAT') | egrep "percentage" | awk '{print $2}')
battery_status=$(upower --show-info $(upower --enumerate | grep 'BAT') | egrep "state" | awk '{print $2}')

if [ $battery_status = "discharging" ];
then
  battery_rate=$(upower -i $(upower -e | grep BAT) | grep "time to empty" | awk '{print $4, $5}')
  battery_rate="($battery_rate) "
else
  battery_rate=''
fi

# Volume
volume_level=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -o -P '\d+%+' | head -n 1)
volume_muted=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')
if [ $volume_muted = "yes" ];
then
  volume_status='(mut)'
else
  volume_status=''
fi

# Network
# Get connected network type (wifi, ethernet, etc.)
# Ethernet
eth_status=$(nmcli -t -f type,state dev | egrep 'ethernet' | awk -F: '{print $2}') 
eth_status=$(echo $eth_status | grep -o -P 'connected')
if [ -n "$eth_status" ];
then
  network_type='eth'
  networl_name=$(nmcli -t -f NAME,TYPE,DEVICE connection show --active | grep 'ethernet' | awk -F: '{print $1}')
else
  # Wifi
  wifi_status=$(nmcli -t -f type,state dev | egrep 'wifi' | awk -F: '{print $2}')
  wifi_status=$(echo $wifi_status | grep -o -P 'connected')
  if [ -n "$wifi_status" ];
  then
    network_type='wifi'
    networl_name=$(nmcli -t -f NAME,TYPE,DEVICE connection show --active | grep 'wireless' | awk -F: '{print $1}')
  else
    network_type='No network'
  fi
fi

# Bluetooth
bluetooth_status=$(bluetoothctl show | grep "Powered" | awk '{print $2}')
if [ $bluetooth_status = "yes" ];
then
  bluetooth_status='on'
else
  bluetooth_status='off'
fi

# Cpu
cpu_usage_us=$(top -bn1 | awk '/Cpu/ { print $2}' | tr , .)
cpu_usage_sy=$(top -bn1 | awk '/Cpu/ { print $4}' | tr , .)
cpu_usage=$(echo $cpu_usage_us + $cpu_usage_sy | bc)
cpu_usage=$(printf "%4s" $cpu_usage)

echo "VOL:$volume_status $volume_level | BAT: $battery_charge $battery_rate| CPU: $cpu_usage% | BLU: $bluetooth_status | NET: $network_type ($networl_name) | $date_and_week $current_time "
