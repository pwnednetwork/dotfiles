# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


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
export PATH="$PATH:/home/agent314/bin"
# ==ESP32
export PATH="$PATH:/home/agent314/embedded/esp32/esptool-v5.0.0-linux-amd64/esptool-linux-amd64/"

export PATH="$PATH:/root/.cargo/bin/"


#ZSH_THEME="agnoster"
#ZSH_THEME="jonathan"
export ZSH_THEME="darkblood"
#ZSH_THEME="y-kali"
#ZSH_THEME="headline/headline"
#ZSH_THEME="ubunly"




plugins=(git copyfile copybuffer docker docker-compose nmap virtualenv sudo systemadmin colored-man-pages emoji git-prompt github jump zsh-autosuggestions zsh-syntax-highlighting) 























































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
#rsync2remote "/.config/doom/"
rsync --recursive --exclude-from="${DOTFILES}/.exclude" "${HOME}/.config/doom" "${DOTFILES}/.config"          

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
#source ~/powerlevel10k/powerlevel10k.zsh-theme                                   
                                                                                 
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
source ~/powerlevel10k/powerlevel10k.zsh-theme



# colors in man 
export MANPAGER='vim -M +MANPAGER "+set nonumber" -'

# opam configuration
[[ ! -r /home/agent314/.opam/opam-init/init.zsh ]] || source /home/agent314/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

 # ╔════════════════════════════════════════════════════════════════════════════╗                                                                                                                                                                                                                                               
 # ║ gitignore.io                                                               ║                                                                                                                                                                                                                                               
 # ╚════════════════════════════════════════════════════════════════════════════╝                                                                                                                                                                                                                                                                                                                                                                                                           function gi() { curl -sLw "\n" https://www.toptal.com/developers/gitignore/api/$@ ;}
 # the gitignore.io code is several advanced command line methods 
 # smooshed together
 # reference: https://docs.gitignore.io/use/advanced-command-line
 # fish files have also been modified
 #
 # old simple gi
 # function gi() { curl -sL https://www.toptal.com/developers/gitignore/api/$@ ;}

# new version of gi permits passing arguments to curl
# thanks @git2samus
# notice the ( ) parenthesies, the code below is running in subshell
# which means we don't have to save and restore IFS
function gi()  (

   # turn on debugging output
   #   set -x
   # declare arrays
   local -a gi_args=()
   local -a curl_args=() # without this we'd be getting an empty argument error

    for arg; do
        if [[ $arg = -- ]]; then
            curl_args=("${gi_args[@]}")
            gi_args=()
        else
            gi_args+=("$arg")
        fi
    done
    IFS=,
    curl "${curl_args[@]}" https://www.toptal.com/developers/gitignore/api/"${gi_args[*]}"

    # turn off debugging output
#    set +x
)


# completion for zsh

_gitignoreio_get_command_list() {
  curl -sL https://www.toptal.com/developers/gitignore/api/list | tr "," "\n"
}

_gitignoreio () {
  compset -P '*,'
  compadd -S '' `_gitignoreio_get_command_list`
}

compdef _gitignoreio gi



# ╔════════════════════════════════════════════════════════════════════════════╗ 
# ║ delta                                                                      ║ 
# ╚════════════════════════════════════════════════════════════════════════════╝ 











#compdef delta

autoload -U is-at-least

_delta() {
    typeset -A opt_args
    typeset -a _arguments_options
    local ret=1

    if is-at-least 5.2; then
        _arguments_options=(-s -S -C)
    else
        _arguments_options=(-s -C)
    fi

    local context curcontext="$curcontext" state line
    _arguments "${_arguments_options[@]}" : \
'--blame-code-style=[Style string for the code section of a git blame line]:STYLE:_default' \
'--blame-format=[Format string for git blame commit metadata]:FMT:_default' \
'--blame-palette=[Background colors used for git blame lines (space-separated string)]:COLORS:_default' \
'--blame-separator-format=[Separator between the blame format and the code section of a git blame line]:FMT:_default' \
'--blame-separator-style=[Style string for the blame-separator-format]:STYLE:_default' \
'--blame-timestamp-format=[Format of \`git blame\` timestamp in raw git output received by delta]:FMT:_default' \
'--blame-timestamp-output-format=[Format string for git blame timestamp output]:FMT:_default' \
'--config=[Load the config file at PATH instead of ~/.gitconfig]:PATH:_files' \
'--commit-decoration-style=[Style string for the commit hash decoration]:STYLE:_default' \
'--commit-regex=[Regular expression used to identify the commit line when parsing git output]:REGEX:_default' \
'--commit-style=[Style string for the commit hash line]:STYLE:_default' \
'--default-language=[Default language used for syntax highlighting]:LANG:_default' \
'--detect-dark-light=[Detect whether or not the terminal is dark or light by querying for its colors]:DETECT_DARK_LIGHT:((auto\:"Only query the terminal for its colors if the output is not redirected"
always\:"Always query the terminal for its colors"
never\:"Never query the terminal for its colors"))' \
'-@+[Extra arguments to pass to \`git diff\` when using delta to diff two files]:STRING:_default' \
'--diff-args=[Extra arguments to pass to \`git diff\` when using delta to diff two files]:STRING:_default' \
'--diff-stat-align-width=[Width allocated for file paths in a diff stat section]:N:_default' \
'--features=[Names of delta features to activate (space-separated)]:FEATURES:_default' \
'--file-added-label=[Text to display before an added file path]:STRING:_default' \
'--file-copied-label=[Text to display before a copied file path]:STRING:_default' \
'--file-decoration-style=[Style string for the file decoration]:STYLE:_default' \
'--file-modified-label=[Text to display before a modified file path]:STRING:_default' \
'--file-removed-label=[Text to display before a removed file path]:STRING:_default' \
'--file-renamed-label=[Text to display before a renamed file path]:STRING:_default' \
'--file-style=[Style string for the file section]:STYLE:_default' \
'--file-transformation=[Sed-style command transforming file paths for display]:SED_CMD:_default' \
'--generate-completion=[Print completion file for the given shell]:GENERATE_COMPLETION:(bash elvish fish powershell zsh)' \
'--grep-context-line-style=[Style string for non-matching lines of grep output]:STYLE:_default' \
'--grep-file-style=[Style string for file paths in grep output]:STYLE:_default' \
'--grep-header-decoration-style=[Style string for the header decoration in grep output]:STYLE:_default' \
'--grep-header-file-style=[Style string for the file path part of the header in grep output]:STYLE:_default' \
'--grep-line-number-style=[Style string for line numbers in grep output]:STYLE:_default' \
'--grep-output-type=[Grep output format. Possible values\: "ripgrep" - file name printed once, followed by matching lines within that file, each preceded by a line number. "classic" - file name\:line number, followed by matching line. Default is "ripgrep" if \`rg --json\` format is detected, otherwise "classic"]:OUTPUT_TYPE:(ripgrep classic)' \
'--grep-match-line-style=[Style string for matching lines of grep output]:STYLE:_default' \
'--grep-match-word-style=[Style string for the matching substrings within a matching line of grep output]:STYLE:_default' \
'--grep-separator-symbol=[Separator symbol printed after the file path and line number in grep output]:STRING:_default' \
'--hunk-header-decoration-style=[Style string for the hunk-header decoration]:STYLE:_default' \
'--hunk-header-file-style=[Style string for the file path part of the hunk-header]:STYLE:_default' \
'--hunk-header-line-number-style=[Style string for the line number part of the hunk-header]:STYLE:_default' \
'--hunk-header-style=[Style string for the hunk-header]:STYLE:_default' \
'--hunk-label=[Text to display before a hunk header]:STRING:_default' \
'--hyperlinks-commit-link-format=[Format string for commit hyperlinks (requires --hyperlinks)]:FMT:_default' \
'--hyperlinks-file-link-format=[Format string for file hyperlinks (requires --hyperlinks)]:FMT:_default' \
'--inline-hint-style=[Style string for short inline hint text]:STYLE:_default' \
'--inspect-raw-lines=[Kill-switch for --color-moved support]:true|false:(true false)' \
'--line-buffer-size=[Size of internal line buffer]:N:_default' \
'--line-fill-method=[Line-fill method in side-by-side mode]:STRING:(ansi spaces)' \
'--line-numbers-left-format=[Format string for the left column of line numbers]:FMT:_default' \
'--line-numbers-left-style=[Style string for the left column of line numbers]:STYLE:_default' \
'--line-numbers-minus-style=[Style string for line numbers in the old (minus) version of the file]:STYLE:_default' \
'--line-numbers-plus-style=[Style string for line numbers in the new (plus) version of the file]:STYLE:_default' \
'--line-numbers-right-format=[Format string for the right column of line numbers]:FMT:_default' \
'--line-numbers-right-style=[Style string for the right column of line numbers]:STYLE:_default' \
'--line-numbers-zero-style=[Style string for line numbers in unchanged (zero) lines]:STYLE:_default' \
'--map-styles=[Map styles encountered in raw input to desired output styles]:STYLES_MAP:_default' \
'--max-line-distance=[Maximum line pair distance parameter in within-line diff algorithm]:DIST:_default' \
'--max-syntax-highlighting-length=[Stop syntax highlighting lines after this many characters]:N:_default' \
'--max-line-length=[Truncate lines longer than this]:N:_default' \
'--merge-conflict-begin-symbol=[String marking the beginning of a merge conflict region]:STRING:_default' \
'--merge-conflict-end-symbol=[String marking the end of a merge conflict region]:STRING:_default' \
'--merge-conflict-ours-diff-header-decoration-style=[Style string for the decoration of the header above the '\''ours'\'' merge conflict diff]:STYLE:_default' \
'--merge-conflict-ours-diff-header-style=[Style string for the header above the '\''ours'\'' branch merge conflict diff]:STYLE:_default' \
'--merge-conflict-theirs-diff-header-decoration-style=[Style string for the decoration of the header above the '\''theirs'\'' merge conflict diff]:STYLE:_default' \
'--merge-conflict-theirs-diff-header-style=[Style string for the header above the '\''theirs'\'' branch merge conflict diff]:STYLE:_default' \
'--minus-empty-line-marker-style=[Style string for removed empty line marker]:STYLE:_default' \
'--minus-emph-style=[Style string for emphasized sections of removed lines]:STYLE:_default' \
'--minus-non-emph-style=[Style string for non-emphasized sections of removed lines that have an emphasized section]:STYLE:_default' \
'--minus-style=[Style string for removed lines]:STYLE:_default' \
'--navigate-regex=[Regular expression defining navigation stop points]:REGEX:_default' \
'--pager=[Which pager to use]:CMD:_default' \
'--paging=[Whether to use a pager when displaying output]:auto|always|never:(auto always never)' \
'--plus-emph-style=[Style string for emphasized sections of added lines]:STYLE:_default' \
'--plus-empty-line-marker-style=[Style string for added empty line marker]:STYLE:_default' \
'--plus-non-emph-style=[Style string for non-emphasized sections of added lines that have an emphasized section]:STYLE:_default' \
'--plus-style=[Style string for added lines]:STYLE:_default' \
'--right-arrow=[Text to display with a changed file path]:STRING:_default' \
'--syntax-theme=[The syntax-highlighting theme to use]:SYNTAX_THEME:_default' \
'--tabs=[The number of spaces to replace tab characters with]:N:_default' \
'--true-color=[Whether to emit 24-bit ("true color") RGB color codes]:auto|always|never:(auto always never)' \
'--whitespace-error-style=[Style string for whitespace errors]:STYLE:_default' \
'-w+[The width of underline/overline decorations]:N:_default' \
'--width=[The width of underline/overline decorations]:N:_default' \
'--word-diff-regex=[Regular expression defining a '\''word'\'' in within-line diff algorithm]:REGEX:_default' \
'--wrap-left-symbol=[End-of-line wrapped content symbol (left-aligned)]:STRING:_default' \
'--wrap-max-lines=[How often a line should be wrapped if it does not fit]:N:_default' \
'--wrap-right-percent=[Threshold for right-aligning wrapped content]:PERCENT:_default' \
'--wrap-right-prefix-symbol=[Pre-wrapped content symbol (right-aligned)]:STRING:_default' \
'--wrap-right-symbol=[End-of-line wrapped content symbol (right-aligned)]:STRING:_default' \
'--zero-style=[Style string for unchanged lines]:STYLE:_default' \
'--24-bit-color=[Deprecated\: use --true-color]:auto|always|never:(auto always never)' \
'--color-only[Do not alter the input structurally in any way]' \
'--dark[Use default colors appropriate for a dark terminal background]' \
'--diff-highlight[Emulate diff-highlight]' \
'--diff-so-fancy[Emulate diff-so-fancy]' \
'--hyperlinks[Render commit hashes, file names, and line numbers as hyperlinks]' \
'--keep-plus-minus-markers[Prefix added/removed lines with a +/- character, as git does]' \
'--light[Use default colors appropriate for a light terminal background]' \
'-n[Display line numbers next to the diff]' \
'--line-numbers[Display line numbers next to the diff]' \
'--list-languages[List supported languages and associated file extensions]' \
'--list-syntax-themes[List available syntax-highlighting color themes]' \
'--navigate[Activate diff navigation]' \
'--no-gitconfig[Do not read any settings from git config]' \
'--parse-ansi[Display ANSI color escape sequences in human-readable form]' \
'--raw[Do not alter the input in any way]' \
'--relative-paths[Output all file paths relative to the current directory]' \
'--show-colors[Show available named colors]' \
'--show-config[Display the active values for all Delta options]' \
'--show-syntax-themes[Show example diff for available syntax-highlighting themes]' \
'--show-themes[Show example diff for available delta themes]' \
'-s[Display diffs in side-by-side layout]' \
'--side-by-side[Display diffs in side-by-side layout]' \
'-h[Print help (see more with '\''--help'\'')]' \
'--help[Print help (see more with '\''--help'\'')]' \
'-V[Print version]' \
'--version[Print version]' \
'::minus_file -- First file to be compared when delta is being used to diff two files:_files' \
'::plus_file -- Second file to be compared when delta is being used to diff two files:_files' \
&& ret=0
}

(( $+functions[_delta_commands] )) ||
_delta_commands() {
    local commands; commands=()
    _describe -t commands 'delta commands' commands "$@"
}

if [ "$funcstack[1]" = "_delta" ]; then
    _delta "$@"
else
    compdef _delta delta
fi




# ╔════════════════════════════════════════════════════════════════════════════╗   
# ║ Aliases                                                                    ║   
# ╚════════════════════════════════════════════════════════════════════════════╝   
                                                                                   
alias chmox="chmod +x"                                                             
                                                                                   

__is_available eza && alias ls='eza --time-style=relative --git --octal-permissions --icons --binary -lg' \
&& alias ll='eza --time-style=long-iso --git --octal-permissions --icons --binary -la' \
&& alias la='eza --time-style=long-iso --git --octal-permissions --binary --changed -lahHgnuU' \
&& alias l='eza --time-style=long-iso --git --icons --binary -l --no-time' \
&& alias lls='eza --time-style=long-iso --git --octal-permissions --icons --binary -las modified' \
&& alias lx='eza --time-style=full-iso --icons --git --extended --context --blocksize --inode --flags --numeric --blocksize --group --mounts --header --long'

# https://github.com/sharkdp/bat                                                  
__is_available bat && alias cat=bat                                                                  
                                                                                  
# https://github.com/neovim/neovim                                                
__is_available nvim && alias vi=nvim && alias vim=nvim && export EDITOR="nvim"                                                         
                                                                                   
                                                                                   
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
                                                                                   
alias r2reloc="r2 -e bin.relocs.apply=true -A"                                     
alias r2cache="r2 -e io.cache=true -A"                                             
                                                                                   


alias get_idf='. $HOME/esp/esp-idf/export.sh'
