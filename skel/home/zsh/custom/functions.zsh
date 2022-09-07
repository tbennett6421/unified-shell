#!/usr/bin/env zsh
function md() {
    mkdir -p "$@" && cd "$@"
}

# find shorthand
function f() {
  find . -name "$1" 2>&1 | grep -v 'Permission denied'
}

function cleanGit() {
  git fetch --all --prune
  # Remove local fully merged branches excerpt current branch and master
  git branch --merged | grep -Ev '(^\*|^\s+master$)' | xargs git branch -d
  # Remove origin fully merged branches except for master
  git branch --all --merged remotes/origin/master | grep --invert-match master | grep --invert-match HEAD | grep "remotes/origin/" | cut -d "/" -f 3- | xargs -n 1 git push --delete origin
  git fetch --all --prune
}

# List path components, one per line
function path() { echo -e ${PATH//:/\\n}; }

# Convert hex to decimal
function h2d() { printf '%d\n' 0x"$1"; }

# Convert decimal to hex
function d2h() { printf '%x\n' "$1"; }

function backup() {
    cp "$1"{,.bak};
}

function extract() {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *.rar)       unrar e $1     ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Print out a color table
function colours() {
  for i in {0..255}; do
    if ((i < 10)); then
      prefix="    "
    elif ((i < 100)); then
      prefix="   "
    else
      prefix="  "
    fi
    printf "\x1b[48;5;${i}m\x1b[38;5;$[255-i]m${prefix}${i} "
    if (((i+1)%16 == 0)); then
      printf "\n"
    fi
  done
  printf "\x1b[0m\n"
}

# Test to see whether your terminal supports truecolor
function truecolor() {
  awk 'BEGIN{
    s="          "; s=s s s s s s s s;
    for (colnum = 0; colnum<77; colnum++) {
      r = 255-(colnum*255/76);
      g = (colnum*510/76);
      b = (colnum*255/76);
      if (g>255) g = 510-g;
      printf "\033[48;2;%d;%d;%dm", r,g,b;
      printf "\033[38;2;%d;%d;%dm", 255-r,255-g,255-b;
      printf "%s\033[0m", substr(s,colnum+1,1);
    }
    printf "\n";
  }'
}

# wh = "who has" -- print the process listening on PORT
function wh() {
  if [[ $# -eq 0 ]]; then
    echo "usage: wh PORT"
  else
    PID=$(netstat -vanp tcp | grep "\*\.$1 " | awk '{ print $9 }')
    if [[ ${PID} -eq 0 ]]; then
      echo "no pid for port $1"
    else
        ps -a "${PID}"
    fi
  fi
}

# Inspired by Brett Terpstra
# Imagine you've made a typo in a command, e.g., `car foo.txt`
# You want to rerun the previous command, changing the first instance of `car` to `cat`
# Just run `fix car cat`
function fix() {
  if [[ $# -ne 2 ]]; then
    echo "usage: fix [bad] [good]"
  else
    local cmd
    cmd=$(fc -ln -1 | sed -e 's/^ +//' | sed -e "s/$1/$2/")
    eval "$cmd"
  fi
}

function sort_excluding_header(){
    awk 'NR<2{print $0;next}{print $0 | "sort" }';
}

# Docker functions
dock-run() { sudo docker run -i -t --privileged $@ ;}
dock-exec() { sudo docker exec -i -t $@ /bin/bash ;}
dock-log() { sudo docker logs --tail=all -f $@ ;}
dock-port() { sudo docker port $@ ;}
dock-vol() { sudo docker inspect --format '{{ .Volumes }}' $@ ;}
dock-ip() { sudo docker inspect --format '{{ .NetworkSettings.IPAddress }}' $@ ;}
dock-rmc() { sudo docker rm sudo docker ps -qa --filter 'status=exited' ;}
dock-rmi() { sudo docker rmi -f sudo docker images | grep '^<none>' | awk '{print $3}' ;}
dock-stop() { sudo docker stop $(docker ps -a -q); }
dock-rm() { sudo docker rm $(docker ps -a -q); }

function last {
    ls -lt $1 | head
}

# copy a file to the clipboard from the command line
function copyfile {
    cat $1 | xclip -selection clipboard
}

# named after screen -Rd
function tmux-reattach-session {
    tmux attach -t $1 2>/dev/null || tmux new -s $1 2>/dev/null
}

function pynew() {
    mkdir -p "$1" && cd "$1"
    pyenv virtualenv "$2" "$1"-"$2"
    pyenv local "$1"-"$2"
    [ -e "requirements.txt" ] && pip install -r requirements.txt  
}

