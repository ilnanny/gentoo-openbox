# __________________________________________________________________________________________________________________
# _____________________________________________________         Bashrc         _________________________________________
# __________________________________________________________________________________________________________________
#
#  ------------------------------------------   >     Shell Interattiva
case $- in
    *i*) ;;
      *) return;;
esac
#  ------------------------------------------   >     Aliases Utente
if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi
#  ------------------------------------------   >     Aliases Globali '.sh'
for sh in /etc/bash/bashrc.d/* ; do
	[[ -r ${sh} ]] && source "${sh}"
done
#  ------------------------------------------   >     Profili
for SH in /etc/profile.d/*.sh; do
       . $SH
done
# ____________________________________________________________________________________
# ________________________________        Direttive      _________________________________
# ____________________________________________________________________________________
export GPG_TTY=$(tty)
export TERM="xterm"
export EDITOR="nano"
export BROWSER="firefox-bin"
export WEBBROWSER="firefox-bin"
export FILEMANAGER="thunar"
export LC_TYPE="it_IT.UTF-8"
export LANG="it_IT.UTF-8"
export XDG_CONFIG_HOME="$HOME/.config"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export PATH="$HOME/bin:/usr/local/bin:$PATH"
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig:/usr/lib/pkgconfig"
export WIKI="$HOME/Wiki"
export SCRIPT="$HOME/Scripts"
export DOTFILE="$HOME/Dotfiles"
# ____________________________________________________________________________________
# ________________________________        Ordinato      _________________________________
export MANWIDTH=90
export HISTSIZE=10000
export HISTIGNORE="q:f:v"
shopt -s direxpand
shopt -s checkhash
shopt -s sourcepath
shopt -s expand_aliases
shopt -s autocd cdspell
shopt -s extglob dotglob
shopt -s no_empty_cmd_completion
shopt -s autocd cdable_vars cdspell
shopt -s cmdhist histappend histreedit histverify
[[ $DISPLAY ]] && shopt -s checkwinsize
# ____________________________________________________________________________________
# ________________________________           Colori          _______________________________
# ____________________________________________________________________________________
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac
red='\[\e[0;31m\]'
blue='\[\e[0;34m\]'
cyan='\[\e[0;36m\]'
green='\[\e[0;32m\]'
yellow='\[\e[0;33m\]'
purple='\[\e[0;35m\]'
nc='\[\e[0m\]'
export PS1="\[\e[0;32m\][\@]\[\e[0;34m\]{\u}\[\e[0;32m\]@\[\e[0;35m\][\H]\[\e[0;32m\]{\w}\[\e[0;35m\]\\$\[$(tput sgr0)\]"
export LESS_TERMCAP_it=$'\e[01;31m'
export LESS_TERMCAP_mb=$'\e[01;31m'
export LESS_TERMCAP_md=$'\e[01;31m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;44;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[01;32m'
# ______________________________________________________________________________________
# ________________________________        Utilità  TTY       ________________________________
# ______________________________________________________________________________________
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' non puoi estrarlo con ex()" ;;
    esac
  else
    echo "'$1' non è un file valido"
  fi
}

mdf()
{
    local cols
    cols=$(( ${COLUMNS:-$(tput cols)} / 3 ))
    for fs in "$@"; do
        [[ ! -d $fs ]] && printf "%s :Nessun file o directory con questo nome" "$fs" && continue
        local info=($(command df -P $fs | awk 'END{ print $2,$3,$5 }'))
        local free=($(command df -Pkh $fs | awk 'END{ print $4 }'))
        local nbstars=$((cols * info[1] / info[0]))
        local out="["
        for ((i=0; i<cols; i++)); do
            [[ $i -lt $nbstars ]] && out=$out"*" || out=$out"-"
        done
        out="${info[2]} $out] (${free[*]} free on $fs)"
        printf "%s" "$out"
    done
}

mip()
{
    local ip
    ip=$(/bin/ifconfig "$(ifconfig | awk -F: '/RUNNING/ && !/LOOP/ {print $1}')" |
        awk '/inet/ { print $2 } ' | sed -e s/addr://)
    printf "%s" "${ip:-Non connesso}"
}

ii()
{
    echo -e "\nSei connesso come \e[1;31m$HOSTNAME"
    echo -e "\n\e[1;31mInformazioni aggiuntive:\e[m " ; uname -a
    echo -e "\n\e[1;31mUtenti loggati:\e[m "         ; w -hs | awk '{print $1}' | sort | uniq
    echo -e "\n\e[1;31mData Odierna:\e[m "            ; date
    echo -e "\n\e[1;31mStatistiche della Macchina:\e[m "           ; uptime
    echo -e "\n\e[1;31mStatistiche della Memoria:\e[m "            ; free
    echo -e "\n\e[1;31mSpazio sul Disco:\e[m "               ; mdf / $HOME
    echo -e "\n\e[1;31mIndirizzo IP Locale:\e[m"         ; mip
    echo -e "\n\e[1;31mConnessioni Aperte:\e[m "        ; netstat -pan --inet;
    echo
}
#
# Archlinux - AUR:
# export YAY_COLORS="nb=1:pkg=1:ver=1;32:lver=1;45:installed=1;42:grp=1;34:od=1;41;5:votes=1;44:dsc=0:other=1;35"
# __________________________________________________________________________________________________________________________________
# ___________________________________________________          Fine         _____________________________________________________________
# __________________________________________________________________________________________________________________________________
