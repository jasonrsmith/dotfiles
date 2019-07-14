alias recent-branches="git for-each-ref --sort=-committerdate refs/heads/ --format='%(color:yellow)%(refname:short)|%(color:bold green)%(committerdate:relative)|%(color:blue)%(subject)|%(color:magenta)%(authorname)%(color:reset)' | column -ts'|'"

if which ruby >/dev/null && which gem >/dev/null; then
  PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi

export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export EDITOR=vim

set -o vi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


#[[ -n $TMUX ]] && alias vim="zsh ~/.bin/vim-tmux-open.zsh"
#. /home/jasmith/.linuxbrew/etc/profile.d/z.sh
#unalias z
z() {
  if [[ -z "$*" ]]; then
    cd "$(_z -l 2>&1 | fzf +s --tac | sed 's/^[0-9,.]* *//')"
  else
    _last_z_args="$@"
    _z "$@"
  fi
}

zz() {
  cd "$(_z -l 2>&1 | sed 's/^[0-9,.]* *//' | fzf -q $_last_z_args)"
}
alias j=z
alias jj=zz
