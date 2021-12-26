#! /bin/sh

function dpull() {
  sudo docker pull registry.hespul.org:5000/epices/postgresql
}

function db() {
  sudo docker exec -it $1 psql -U rails -d epices2
}

function dr() {
  docker run -d --name $1 --restart unless-stopped -p 5434:5432 registry.hespul.org:5000/epices/postgresql:latest
}

function dbtest() {
  rake db:create db:structure:load
}

# Kill puma process (normally last pid)
function kpid() {
  pidlist=(`lsof -t -wni tcp:3000`)
  kill -9 $pidlist[-1]
}

# Change audio source1
function s1() { # steelseries arctis chat
  pacmd set-default-sink alsa_output.usb-SteelSeries_SteelSeries_Arctis_5_00000000-00.analog-chat
}

function s2() { # Sony SRS XB1
  pacmd set-default-sink bluez_sink.F8_DF_15_78_98_05.a2dp_sink
}

function s3() { # Laptop sound
  pacmd set-default-sink alsa_output.pci-0000_06_00.6.analog-stereo
}

function edev() {
  tmux has-session -t epices-dev &> /dev/null

  if [[ $? != 0 ]]
  then
    tmux new-session -s epices-dev -d
    tmux send-keys -t epices-dev '/home/nico/PROJECTS/epices2' C-m
    tmux send-keys -t epices-dev C-l
    tmux new-window -t epices-dev -c '/home/nico/PROJECTS/epices2' -d
    tmux new-window -t epices-dev -c '/home/nico/PROJECTS/epices2' -d
  fi

  tmux attach -t epices-dev
}

function monitor_setup {
  if [[ -n "$(xrandr |grep ' connected' |grep 'DisplayPort')" ]]; then
    screen_setup=3

    xrandr \
    --output eDP --mode 1920x1080 --pos 1080x1410 --rotate normal \
    --output HDMI-A-0 --primary --mode 1920x1080 --pos 1921x330 --rotate normal \
    --output DisplayPort-0 --off \
    --output DisplayPort-1 --mode 1920x1080 --pos 0x0 --rotate normal

  elif [[ -n "$(xrandr |grep ' connected' |grep 'HDMI')" ]]; then
    screen_setup=2

    xrandr \
    --output eDP --mode 1920x1080 --pos 0x0 --rotate normal \
    --output HDMI-A-0 --primary --mode 1920x1080 --pos 1920x0 --rotate normal \
    --output DisplayPort-0 --off \
    --output DisplayPort-1 --off

  else
    screen_setup=1

    xrandr \
    --output eDP --mode 1920x1080 --pos 0x0 --rotate normal

  fi
}

function reload_xset() {
  xset r rate 220 55
}

function alt_layout() {
  for d in $(bspc query --nodes -d 2)
    bspc node $d -c

  bspc node @2:/ -i
  bspc node @2:/ -p east -i
  bspc node @2:/1 -o 0.65 -p south -i
  bspc node @2:/2 -o 0.30 -p south -i

  bspc rule --add Chromium-browser -o node=@2:/1/1
  bspc rule --add Chromium-browser -o node=@2:/1/2
  bspc rule --add Alacritty -o node=@2:/2/2
  bspc rule --add Thunderbird -o node=@2:/2/1

  chromium --app='https://rocketchat.hespul.org/home' &
  chromium --app='https://play.workadventu.re/_/Brotteaux/dev-epices.github.io/workadventure-brotteaux/map.json#starts/start-nico' --new-window &
  alacritty --option font.size=8 --command spt &
  thunderbird &
}

function caca() {
  alacritty
}
# # attach to last tmux session
# current_terminal=$(ps -p $(ps -p $$ -o ppid=) o args=)
# if [ ${current_terminal##*/} = 'terminator' ]; then
#   edev
# elif [ ${current_terminal##*/} = 'konsole' ]; then
#   ncspot
# fi