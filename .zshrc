# load colors

autoload -U colors && colors	
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# global environmental variables

export LANG=fr_FR.UTF-8
export OMZ="$HOME/.oh-my-zsh"
export ANDROID_HOME="$HOME/Android/Sdk"
export SDKMAN_DIR="$HOME/.sdkman"
export USR_LOCAL="/usr/local"
export GO_DIR="$USR_LOCAL/go"
export JAVA_HOME="$SDKMAN_DIR/candidates/java/current"
export HOME_LOCAL="$HOME/.local"
export PYENV_DIR="$HOME/.pyenv"
export DART_CACHE_DIR="$HOME/.pub-cache"
export TFENV_HOME="$HOME/.tfenv"

export PATH=$JAVA_HOME/bin:$TFENV_HOME/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools/bin:$HOME/bin:$HOME_LOCAL/bin:$USR_LOCAL/bin:$GO_DIR/bin:$DART_CACHE_DIR/bin:$PYENV_DIR/bin:$PATH

# history

HISTSIZE=10000000
SAVEHIST=10000000
HISTTIMEFORMAT="%F %T "
HISTCONTROL=ignoreboth

# ohmyzsh configurations

EDITOR=code
VSCODE=code
ZSH_THEME="nicoulaj"
DISABLE_MAGIC_FUNCTIONS="true"
COMPLETION_WAITING_DOTS="true"

ZSH_WEB_SEARCH_ENGINES=(
    github "https://github.com/search?q="
    stackoverflow "https://stackoverflow.com/search?q="
    google "https://www.google.com/search?q="
)

plugins=( # to add more:  https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins
  git
  python
  sudo
  adb
  gitignore
  flutter
  vscode
  kubectl
  web-search
)

# custom commands

alias adb_show_layoutbounds='adb shell setprop debug.layout true ; adb shell service call activity 1599295570'
alias adb_hide_layoutbounds='adb shell setprop debug.layout false ; adb shell service call activity 1599295570'
alias adb_show_nav='adb shell settings put global policy_control null'
alias adb_hide_nav='adb shell settings put global policy_control immersive.status=com.package1,com.package2:immersive.navigation=apps,-com.package3'
alias adb_shutdown='adb shell reboot -p'
alias adb_go_settings='adb shell am start -a android.settings.SETTINGS'
alias adb_go_home='adb shell am start -a android.intent.action.MAIN -c android.intent.category.HOME'
alias adb_go_wifi='adb shell am start -a android.intent.action.MAIN -n com.android.settings/.wifi.WifiSettings'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Loading configurations

[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"
[[ -s "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"
[[ -s "$OMZ/oh-my-zsh.sh" ]] && source "$OMZ/oh-my-zsh.sh"

source <(kubectl completion zsh)
