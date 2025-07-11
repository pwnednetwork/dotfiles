
# ╔──────────────────────────────────────────────────────────────────────────╗
# │                                                                          │
# │    █████╗  ██████╗ ███████╗███╗   ██╗████████╗    ██████╗  ██╗██╗  ██╗   │
# │   ██╔══██╗██╔════╝ ██╔════╝████╗  ██║╚══██╔══╝    ╚════██╗███║██║  ██║   │
# │   ███████║██║  ███╗█████╗  ██╔██╗ ██║   ██║        █████╔╝╚██║███████║   │
# │   ██╔══██║██║   ██║██╔══╝  ██║╚██╗██║   ██║        ╚═══██╗ ██║╚════██║   │
# │   ██║  ██║╚██████╔╝███████╗██║ ╚████║   ██║       ██████╔╝ ██║     ██║   │
# │   ╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚═╝  ╚═══╝   ╚═╝       ╚═════╝  ╚═╝     ╚═╝   │
# │                                                                          │
# ╚──────────────────────────────────────────────────────────────────────────╝
# .zshrc 
# Majorly borrowing chunks of coode and inspiration from  https://github.com/mrusme/dotfiles/tree/master
# Thanks mrusme!




# ╔════════════════════════════════════════════════════════════════════════════╗
# ║ p10k stuff                                                                 ║
# ╚════════════════════════════════════════════════════════════════════════════╝

# Enable Powerlevel9k instant prompt. Should stay close to the top of ~/.zshrc.
#
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# ╔════════════════════════════════════════════════════════════════════════════╗
# ║ Basics                                                                     ║
# ╚════════════════════════════════════════════════════════════════════════════╝

export OS="$(uname | tr '[:upper:]' '[:lower:]')"

function __is_available {
  prog="${1}"
  os="${2}"

  if [ "${os}" != "" ] && [ "${os}" != "${OS}" ]
  then 
    return 1
  fi

  type "${prog}" > /dev/null 
  return "$?"
}

# ╔════════════════════════════════════════════════════════════════════════════╗
# ║ Exports                                                                    ║
# ╚════════════════════════════════════════════════════════════════════════════╝


export ZSH="$HOME/.oh-my-zsh"
export XDG_CONFIG_HOME=~/.config/
export FPATH="/home/$USER/git/eza/completions/zsh:$FPATH"

export PATH="/home/$USER/build/apache-maven-3.9.9/bin:$PATH"

JAVA_HOME="/usr/lib/jvm/java-23-openjdk-amd64/bin/java"
export PATH="$PATH:/home/$USER/.cargo/bin"
export PATH="$PATH:/home/$USER/Qt/6.8.0/gcc_64/bin"
export PATH="$PATH:/home/$USER/.local/bin"
export PATH="$PATH:/home/$USER/.emacs.d/bin/"
export PATH="$PATH:/home/agent314/.config/emacs/bin/"
# ========== RISCV toolchain =========
export PATH="$PATH:/opt/riscv/bin/"
# ========= Go ================
export PATH="$PATH:/home/$USER/go/bin"
export ANDROID_HOME=~/Android/Sdk/

export PATH="$PATH:/root/.cargo/bin/"

#ZSH_THEME="agnoster"
#ZSH_THEME="jonathan"
export ZSH_THEME="darkblood"
#ZSH_THEME="y-kali"
#ZSH_THEME="headline/headline"
#ZSH_THEME="ubunly"

plugins=(git copyfile copybuffer docker docker-compose nmap virtualenv sudo systemadmin colored-man-pages emoji git-prompt github jump zsh-autosuggestions zsh-syntax-highlighting) 

# ╔════════════════════════════════════════════════════════════════════════════╗
# ║ Aliases                                                                    ║
# ╚════════════════════════════════════════════════════════════════════════════╝

alias chmox="chmod +x"

# https://github.com/eza-community/eza
__is_available eza \
&& alias ls='eza  --time-style=relative --git --octal-permissions --icons \
  --binary -lg' \
&& alias ll='eza  --time-style=long-iso --git --octal-permissions --icons \
  --binary -la' \
&& alias la='eza  --time-style=long-iso --git --octal-permissions         \
  --binary --changed -lahHgnuU' \
&& alias l='eza   --time-style=long-iso --git                     --icons \
  --binary -l --no-time' \
&& alias lls='eza --time-style=long-iso --git --octal-permissions --icons \
  --binary -las modified'


# https://github.com/sharkdp/bat
__is_available bat \
&& alias cat=bat

# https://github.com/neovim/neovim
__is_available nvim \
&& alias vi=nvim \
&& alias vim=nvim \
&& export EDITOR="nvim"

alias uuid=uuidgen
alias wget='wget --no-hsts'
alias rmrf='rm -rf'
alias ehco=echo

alias tgz='tar -czf'
alias ugz='tar -xzf'
alias tbz='tar -cjf'
alias ubz='tar -xjf'

alias rsync-copy="rsync -ahv --inplace --no-whole-file --info=progress2"

alias my-ip='curl http://ipecho.net/plain; echo'

alias lsblk="lsblk -o +fstype,label,uuid,partuuid"
alias lazyvim="NVIM_APPNAME=lazyvim nvim"
alias chadvim="NVIM_APPNAME=nvchad nvim"
alias vim="lazyvim"
# ╔════════════════════════════════════════════════════════════════════════════╗
# ║ What's ...                                                                 ║
# ╚════════════════════════════════════════════════════════════════════════════╝

function whats() {
  if ! __is_available units || ! __is_available whatis
  then 
    printf "This command requires units(1) and whatis(1)!\n"
    return 1 
  fi 

  value=""
  value_unit=""
  from_unit=""
  to=""
  to_unit=""
  _in=""
  _in_unit=""

  if [ "$#" -eq "1" ]
  then
    if [ "$1" = "love" ]
    then 
      printf "... got to do, got to do with it?\n"
      return 0 
    else 
      whatis "$1"
      return "$?"
    fi 
  elif [ "$#" -eq "2" ]
  then
    value_unit="$1"
    to_unit="$2"
  elif [ "$#" -eq "3" ]
  then
    if [ "$2" = "to" ] || [ "$2" = "in" ] || [ "$2" = "of" ]
    then 
      value_unit="$1"
      to="$2"
      to_unit="$3"
    else 
      value="$1"
      from_unit="$2"
      to_unit="$3"
    fi
  elif [ "$#" -eq "4" ]
  then 
    value="$1"
    from_unit="$2"
    to="$3"
    to_unit="$4"
  elif [ "$#" -eq "5" ]
  then
    value="$1"
    from_unit=""
    to="$2"
    to_unit="$3"
    _in="$4"
    _in_unit="$5"
  else
    printf "usage: %s <value>[[ ]unit] [to/in|of] <to/in unit/value|of value> [in %%]\n" "$0"
    printf "\n"
    printf "examples:\n"
    printf "\n"
    printf "  %s 20 kmh in mph\n" "$0"
    printf "  %s 3 cups in ml\n" "$0"
    printf "  %s 6ft to m\n" "$0"
    printf "  %s 10%% of 120\n" "$0"
    printf "  %s 10 of 200 in %%\n" "$0"
    printf "  %s 10 to 100 in %%\n" "$0"
    printf "\n"
    return 1 
  fi

  if [ "${value_unit}" != "" ]
  then
    combined="$(printf "%s" "${value_unit}" | grep -Eo '[[:alpha:]\$\%]+|[0-9]+')"
    value="$(printf "%s" "${combined}" | head -n 1)"
    from_unit="$(printf "%s" "${combined}" | tail -n 1)"
  fi

  from_unit=$(printf "%s" "${from_unit}" | tr '[:upper:]' '[:lower:]')
  to_unit=$(printf "%s" "${to_unit}" | tr '[:upper:]' '[:lower:]')

  units_from="${value}${from_unit}"
  units_to="${to_unit}"

  case "${from_unit}" in 
    "f")
      units_from="tempF(${value})"
      ;;
    "c")
      units_from="tempC(${value})"
      ;;
    "kmh")
      units_from="${value} km/hour"
      ;;
  esac 

  case "${to_unit}" in 
    "f")
      units_to="tempF"
      ;;
    "c")
      units_to="tempC"
      ;;
    "kmh")
      units_to="km/hour"
      ;;
  esac
  
  if [ "${from_unit}" = "%" ]
  then 
    eva "(${value} / 100) * ${units_to}" | tr -d ' '
    return "$?"
  elif [ "${_in}" != "" ] && [ "${_in_unit}" = "%" ]
  then 
    if [ "${to}" = "of" ]
    then
      eva "(${value} / ${to_unit}) * 100" | tr -d ' '
      return "$?"
    elif [ "${to}" = "to" ]
    then 
      eva "((${to_unit} - ${value}) / ${value}) * 100" | tr -d ' '
      return "$?"
    fi
  else
    units --compact -1 "${units_from}" "${units_to}"
    return "$?"
  fi
}



# ╔════════════════════════════════════════════════════════════════════════════╗
# ║ Dotfiles management                                                        ║
# ╚════════════════════════════════════════════════════════════════════════════╝

export DOTFILES="${HOME}/projects/dotfiles"

function cp2remote ()
{
  echo "Copying ${1} from ${HOME} to ${DOTFILES}\n"
  cp "${HOME}/${1}" "${DOTFILES}/${1}"
}




function rsync2remote() {
    local source_path="${HOME}${1}"
    local dest_path="${DOTFILES}${1}"
    echo "Syncing from ${source_path} to ${dest_path}"
    mkdir -p "$(dirname "${dest_path}")"
    rsync -avH --exclude-from="${HOME}/.exclude" "${source_path}/" "${dest_path}/"
}



# simplifies copying folders of configuration files
dotconfig-rsync() {
    local config_name="$1"
    
    if [[ -z "$config_name" ]]; then
        echo "Usage: dotconfig-rsync <config_name>" >&2
        return 1
    fi
    
    if [[ ! -d "${HOME}/.config/${config_name}" ]]; then
        echo "Error: ${HOME}/.config/${config_name} does not exist" >&2
        return 1
    fi
    
    echo "dotconfig-rsync: copying ${config_name}"    
    rsync-copy --exclude-from="${HOME}/.exclude" \
        "${HOME}/.config/${config_name}" \
        "${DOTFILES}/.config/"
}

# copies updated dotfiles to staging in prep for commit and push
dotfiles-to-staging() {

  cp "${HOME}/.zshrc" "${DOTFILES}/.zshrc"
  cp2remote ".kopiaignore"
  cp2remote ".vimrc"
  cp2remote ".tmux.conf"
  cp2remote ".tmux.cheatsheet"
  cp2remote ".exclude"
  cp2remote ".zshrc"

 echo "DELETING the internals of target .config folder" 
 rm -rf "${DOTFILES}/.config/*"
 

 mkdir -p "${DOTFILES}/.config/doom"  
 
# rsync-copy --exclude-from="${HOME}/.exclude" "${HOME}/.config/lazyvim" "${DOTFILES}/.config/"
# rsync-copy --exclude-from="${HOME}/.exclude" "${HOME}/.config/lvim" "${DOTFILES}/.config/"
# rsync-copy --exclude-from="${HOME}/.exclude" "${HOME}/.config/alacritty" "${DOTFILES}/.config/"
# rsync-copy --exclude-from="${HOME}/.exclude" "${HOME}/.config/ghostty" "${DOTFILES}/.config/"

echo "dotconfig-rsyncing a bunch of important folders (vims, alacri- and ghos- tty)"
dotconfig-rsync "lazyvim"
dotconfig-rsync "lvim"
dotconfig-rsync "alacritty"
dotconfig-rsync "ghostty"

echo "backup cargo install list"
cargo install --list > "${DOTFILES}/cargo_install_--list"

echo "copying ghostty config to staging"                                  
cp "${HOME}/.config/ghostty/config"  "${DOTFILES}/.config/ghostty/config" 

echo "copy emacs config folder to staging"
rsync2remote "/.config/doom/"
# temporarily just copying the doom folder with normal means


}

function cp2local()
{
  echo "Copying ${1} from ${DOTFILES} to ${HOME}"
   cp "${DOTFILES}/${1}" "${HOME}/${1}"
}


function dotfiles-to-local() {
  printf "are you sure? (y/n) "
  read -r confirmation

  [ "${confirmation}" != "y" ] && return 1
  
  cp2local ".zshrc"
  cp2local ".tmux.conf"
  cp2local ".tmux.cheathseet"
  cp2local ".vimrc"
  cp2local ".kopiaignore"
  cp2local ".exclude"

  rsync -avH "${DOTFILES}/.config/nvim" "${HOME}/.config/nvim"
  rsync -avH "${DOTFILES}/.config/alacritty" "${HOME}/.config/alacritty"
  rsync -avH "${DOTFILES}/.config/lazyvim" "${HOME}/.config/lazyvim"
  rsync -avH "${DOTFILES}/.config/chadvim" "${HOME}/.config/chadvim"
  rsync -avH "${DOTFILES}/.config/ghostty" "${HOME}/.config/ghostty"
 }




# ╔════════════════════════════════════════════════════════════════════════════╗ 
# ║ OMZ & p10k                                                                 ║ 
# ╚════════════════════════════════════════════════════════════════════════════╝ 
                                                                                 
source $ZSH/oh-my-zsh.sh                                                         
source ~/powerlevel10k/powerlevel10k.zsh-theme                                   
                                                                                 
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.                 
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh                                     
                                                                                 
 # ╔════════════════════════════════════════════════════════════════════════════╗                                                                                                                                                                                                                                              
 # ║ Exports                                                                    ║  
 # ╚════════════════════════════════════════════════════════════════════════════╝  
export SDKMAN_DIR="$HOME/.sdkman"

[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
if command -v zoxide > /dev/null; then
  eval "$(zoxide init zsh)"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# Source the Lazyman shell initialization for aliases and nvims selector
# shellcheck source=.config/nvim-Lazyman/.lazymanrc
[ -f ~/.config/nvim-Lazyman/.lazymanrc ] && source ~/.config/nvim-Lazyman/.lazymanrc
# Source the Lazyman .nvimsbind for nvims key binding
# shellcheck source=.config/nvim-Lazyman/.nvimsbind
[ -f ~/.config/nvim-Lazyman/.nvimsbind ] && source ~/.config/nvim-Lazyman/.nvimsbind
export PATH="$PATH:~/.config/emacs/bin/"
export PATH=/home/agent314/tools/AFLplusplus:$PATH

export JAVA_HOME=/opt/openjdk-bin-21.0.6_p7/

alias ascii2header="python3 /Users/agent314/ascii2header/ascii2header.py"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/etc/profile.d/conda.sh" ]; then
        . "/usr/etc/profile.d/conda.sh"
    else
        export PATH="/usr/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<



export SSLKEYLOGFILE=~/.ssl-key.log

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
