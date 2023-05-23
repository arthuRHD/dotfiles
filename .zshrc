# global environmental variables

export LANG=fr_FR.UTF-8
export ZSH="$HOME/.oh-my-zsh"
export ANDROID_HOME="$HOME/Android/Sdk"
export NVM_DIR="$HOME/.nvm"
export SDKMAN_DIR="$HOME/.sdkman"
export GO_DIR="/usr/local/go"
export JAVA_HOME="$HOME/.sdkman/candidates/java/current"
export USR_LOCAL="/usr/local"
export HOME_LOCAL="$HOME/.local"
export PYENV_DIR="$HOME/.pyenv"
export DART_CACHE_DIR="$HOME/.pub-cache"
export TFENV_HOME="$HOME/.tfenv"

# scaneo specific
export BB_HOME="/opt/scaneo/"
export MACHINE_IP=192.168.52.128

# all
export PATH=$BB_HOME:$JAVA_HOME/bin:$TFENV_HOME/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools/bin:$HOME/bin:$HOME_LOCAL/bin:$USR_LOCAL/bin:$GO_DIR/bin:$DART_CACHE_DIR/bin:$PYENV_DIR/bin:$PATH

# ohmyzsh configurations

VSCODE=code
ZSH_THEME="nicoulaj"
DISABLE_MAGIC_FUNCTIONS="true"
COMPLETION_WAITING_DOTS="true"

ZSH_WEB_SEARCH_ENGINES=(
    github "https://github.com/search?q="
    stackoverflow "https://stackoverflow.com/search?q="
    google "https://www.google.com/search?q="
)

plugins=(
  git # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git
  python # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/python
  sudo # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/sudo
  adb # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/adb
  gitignore # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/gitignore
  flutter # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/flutter
  vscode # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/vscode
  kubectl # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/kubectl
  web-search # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/web-search
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

# budgetbox

alias reset_scaneo_db="mysql -h localhost -P 3308 -u root --execute='source /home/arichard/workspace/pssbb/pssbb-scripting/src/etc/sql/createDatabase_Scaneo.sql'"
alias bitwarden="cat ~/.bitwarden | xclip -sel clip"

init_pyenv () {
	eval "$(pyenv init -)"
	eval "$(pyenv virtualenv-init -)"
}

# Loading configurations

[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

source $ZSH/oh-my-zsh.sh
source <(kubectl completion zsh)
