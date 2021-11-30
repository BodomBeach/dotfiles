# Set up the prompt

autoload -Uz promptinit
promptinit
prompt suse

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

# NICO CUSTOM CONFIG

unsetopt correct_all

alias pid='echo "kill -9 PID" && lsof -wni tcp:3000'
alias mdr='echo `lsof -t -wni tcp:3000`[-1]'
alias wds='./bin/webpack-dev-server'
alias sk='bundle exec sidekiq'
alias rs='rails s'
alias rc='rails c'
alias rdm='rake db:migrate'
alias rdms='rake db:migrate:status'
alias rdr='rake db:rollback'
alias rdt='rake db:test:prepare'
alias rdtt='rake db:drop db:create db:migrate db:seed'
alias e2='cd ~/PROJECTS/epices2'
alias pk='cd ~/PROJECTS/parakraken'
alias dps='docker ps -a --format "{{.Names}} --- {{.Status}} -- -{{.Ports}}"'
alias ds='docker start'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


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
  rake db:test:prepare
}

function qq() {
  xrandr --output eDP --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-A-0 --off --output DisplayPort-0 --off --output DisplayPort-1 --primary --mode 1920x1080 --pos 1929x0 --rotate normal
}

function qq2() {
  xrandr --output eDP --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-A-0 --primary --mode 1920x1080 --pos 1929x0 --rotate normal --output DisplayPort-0 --off --output DisplayPort-1 --off
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

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
cd .

# run screen setup on terminal init
qq2