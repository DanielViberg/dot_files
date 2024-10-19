# Utilities 
function echoInBold() {
  echo -e "\033[1m$1\033[0m"
}

# VPN
function vpn () {
  echoInBold "Available VPN profiles:"
  nmcli connection show | grep vpn
  echo " "
  echoInBold "Connected VPN profiles:"
  nmcli connection show --active | grep vpn
}

function vpn-connect () {
  nmcli connection up $1
}

function vpn-disconnect () {
  nmcli connection down $1
}

# WIFI
function wifi () {
   echoInBold "WiFi status:"
   nmcli device status | grep wifi
   echo " "
   echoInBold "Available WiFi networks:"
   nmcli device wifi list
   echo " "
   echoInBold "Connected WiFi networks:"
   nmcli connection show --active | grep wifi
}

function wifi-status () {
  nmcli device status | grep wifi
}

function wifi-enable () {
  nmcli radio wifi on
}

function wifi-disable () {
  nmcli radio wifi off
}

function wifi-connect () {
  read -p "Enter the SSID: " ssid
  read -sp "Enter the password: " password
  nmcli device wifi connect $ssid password $password
}

# ETHERNET
function ethernet () {
   echoInBold "Ethernet status:"
   nmcli device status | grep ethernet
   echo " "
   echoInBold "Connected Ethernet networks:"
   nmcli connection show --active | grep ethernet
}

# BLUETOOTH
function bluetooth () {
   echoInBold "Bluetooth status:"
   bluetoothctl show | grep Powered
   echo " "
   echoInBold "Connected Bluetooth devices:"
   bluetoothctl paired-devices
}

function bluetooth-status () {
  bluetoothctl show | grep Powered
}

function bluetooth-enable () {
  bluetoothctl power on
}

function bluetooth-disable () {
  bluetoothctl power off
}

function bluetooth-scan () {
  bluetoothctl scan on
}

function bluetooth-pair () {
  read -p "Enter the MAC address: " mac
  bluetoothctl pair $mac
  bluetoothctl trust $mac
}

# SOUND 
function sound () {
   echoInBold "Sound status:"
   echo " "
   echoInBold "Output devices:"
   pacmd list-sinks | grep -e 'device.description' | grep -oP '"\K[^"]+'
   echo " "
   echoInBold "Input devices:"
   pacmd list-sources | grep -e 'device.description' | grep -oP '"\K[^"]+'
   echo " "
}

function sound-set-output () {
  echoInBold "Available output devices:"
  pacmd list-sinks | grep -e 'index:' -e 'device.description' 
  read -p "Enter the output device name: " output
  pacmd set-default-sink $output
}

function sound-set-input () {
 echoInBold "Available input devices:"
  pacmd list-sources | grep -e 'index:' -e 'device.description'
  read -p "Enter the input device name: " input
}


