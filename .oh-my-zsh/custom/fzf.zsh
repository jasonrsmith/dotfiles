v() {
  local files
  local dir
  local file
  files=$(grep '^>' ~/.viminfo |grep -v COMMIT_EDITMSG| cut -c3- |
          while read line; do
            [ -f "${line/\~/$HOME}" ] && echo "$line"
          done | fzf-tmux -d -m -q "$*" -1) && 
            [[ ${files//\~/$HOME} =~ ^$HOME/git ]] &&
            eval $(echo ${files//\~/$HOME}|perl -pe "s|^($HOME/git/.*?)/(.*)|dir=\$1;file=\"\$2\"|;") &&
            cd "$dir" && vim "$file" ||
            vim ${files//\~/$HOME}
#           done | fzf-tmux -d -m -q "$*" -1) && vim ${files//\~/$HOME}
}
