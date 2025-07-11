# ~/.config/fish/config.fish

# エイリアス（関数）

alias g="git"
alias gs="git status"
alias gc="git commit"
alias gcm="git commit -m"
alias gl="git log --oneline --graph --all"
alias ga="git add"
alias push="git push"
alias pull="git pull"

# 色付き ls（Macの場合は gls 推奨）
alias ls="ls --color=auto"
alias ll="ls -alF"

alias cc="claude"
alias yolo="claude --dangerously-skip-permissions"
alias fish-reload="source ~/.config/fish/config.fish"

# gh
alias gh-login="BROWSER=noprompt gh auth login"

# 日本語対応
set -x LANG ja_JP.UTF-8
set -x LC_ALL ja_JP.UTF-8

# デフォルトのエディタ
set -x EDITOR nvim

# PATH の追加
set -x PATH $HOME/.local/bin $PATH
set -x PATH $HOME/.lmstudio/bin $PATH
set -x PATH $HOME/go/bin $PATH
set -x PATH /opt/homebrew/bin $PATH

