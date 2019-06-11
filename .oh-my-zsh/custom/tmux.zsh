
switchtarget()
{
  local panes current_window current_pane target target_window target_pane
  target=$1
  current_window=$(tmux display-message -p '#I')

  target_window=$(echo $target | awk 'BEGIN{FS=":| "}{print$3}')
  target_pane=$(echo $target | awk 'BEGIN{FS=":| "}{print$4}' | cut -c 1)

  if [[ $current_window -eq $target_window ]]; then
    tmux select-pane -t ${target_window}.${target_pane}
  else
    tmux select-pane -t ${target_window}.${target_pane} &&
    tmux select-window -t $target_window
  fi
}

# ftpane - switch pane (@george-b)
ftpane() {
  local panes current_window current_pane target target_window target_pane
  panes=$(tmux list-panes -s -F '#{pane_current_path} #{pane_current_command} #I:#P'|sort)
  #echo "panes=$(tmux list-panes -s -F '#{pane_current_path} #{pane_current_command} #I:#P')"

  current_pane=$(tmux display-message -p '#I:#P')
  current_window=$(tmux display-message -p '#I')

  target=$(echo "$panes" | grep -v "$current_pane" | fzf +m --reverse) || return
  switchtarget $target
}

#TODO - lru
ftpanelru() {
  local panes current_window current_pane target target_window target_pane
  panes=$(tmux list-panes -s -F '#{pane_current_path} #{pane_current_command} #I:#P'|sort)
  current_pane=$(tmux display-message -p '#I:#P')

  target=$(echo "$panes" | grep -v "$current_pane" | fzf +m --reverse) || return
  switchtarget $target
}

alphaswitch_l() {
  local panes current_window current_pane target
  panes=$(tmux list-panes -s -F '#{pane_current_path} #{pane_current_command} #I:#P'|sort)
  current_pane=$(tmux display-message -p '#I:#P')

  target=$(echo $panes|grep -A 1 $current_pane|sed -n 2p)
  target="${target:-$(echo $panes|head -1)}"

  switchtarget $target
}

alphaswitch_r() {
  local panes current_window current_pane target
  panes=$(tmux list-panes -s -F '#{pane_current_path} #{pane_current_command} #I:#P'|sort)
  current_pane=$(tmux display-message -p '#I:#P')

  target=$(echo $panes|tac|grep -A 1 $current_pane|sed -n 2p)
  target="${target:-$(echo $panes|tail -1)}"
  switchtarget $target
}

# In tmux.conf
# bind-key 0 run "tmux split-window -l 12 'bash -ci ftpane'"
