fish_vi_key_bindings

function fish_prompt; end

bind -M insert \ce forward-char
bind -M insert \co fcf

alias ls='ls --group-directories-first'

function fcf
    set -l dirs "$(eval $FZF_DEFAULT_CD_COMMAND)"
    set -l dir "$(echo "$dirs" | fzf --height '40%')"
    [ -d "$dir" ] && cd "$dir"
    commandline -f repaint
end

set -x LANG en_US.UTF-8
set -x COLORTERM truecolor
set -x EDITOR nvim
set -x PAGER 'less --mouse'
set -x FZF_DEFAULT_COMMAND "find -type f -not -path '*/.git/*' -not -path '*/target/*'"
set -x FZF_DEFAULT_CD_COMMAND "find -type d -not -path '*/.git/*' -not -path '*/target/*'"
set -x FZF_DEFAULT_OPTS '--reverse'
