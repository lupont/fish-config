fish_vi_key_bindings

function fish_prompt; end

bind -M insert \ce forward-char
bind -M insert \co fcf

alias ls='ls --group-directories-first'

function fcf
    set -l folders "$(find -L "$HOME" -maxdepth 2)"
    set -l folder (echo "$folders" | fzf --height '40%')

    [ -z "$folder" ] && commandline -f repaint && return

    cd "$folder"
    commandline -f repaint
end

set -x LANG en_US.UTF-8
set -x COLORTERM truecolor
set -x EDITOR nvim
set -x PAGER 'less --mouse'
set -x FZF_DEFAULT_COMMAND "fd -H --type f -E '**/.git/*' -E '*.o' -E '**/target/*' -E '**/node_modules/*' -E '**/*.class' -E '**/bin/*'"
set -x FZF_DEFAULT_OPTS '--reverse'
