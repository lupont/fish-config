fish_vi_key_bindings

function fish_prompt; end

bind -M insert \ce forward-char
bind -M insert \co fcf

alias exa='exa --group-directories-first'

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
set -x BROWSER librewolf
set -x PDFVIEWER zathura
set -x PAGER 'less --mouse'
set -x FZF_DEFAULT_COMMAND "fd -H --type f -E '**/.git/*' -E '*.o' -E '**/target/*' -E '**/node_modules/*' -E '**/*.class' -E '**/bin/*'"
set -x FZF_DEFAULT_OPTS '--reverse'
set -x ANDROID_SDK_ROOT /opt/android-sdk/
set -x VIRSH_DEFAULT_CONNECT_URI qemu:///system

set -ga fish_user_paths "$HOME/.cargo/bin"
set -ga fish_user_paths "$HOME/.local/android/sdk/emulator"
set -ga fish_user_paths "$HOME/.local/android/sdk/tools"
set -ga fish_user_paths "$HOME/.local/bin"
set -ga fish_user_paths "$HOME/.local/npm/bin"
set -ga fish_user_paths "$HOME/.local/scripts"
set -ga fish_user_paths "$HOME/.local/scripts/dmenu"
set -ga fish_user_paths "$HOME/.local/scripts/statusbar"
set -ga fish_user_paths /usr/local/sbin
set -ga fish_user_paths "$HOME/.local/bin/proton-ge-7.16"
set -ga fish_user_paths /usr/local/opt/python@3.7/bin
set -ga fish_user_paths "$ANDROID_SDK_ROOT/platform-tools/"
set -ga fish_user_paths "$ANDROID_SDK_ROOT/tools/bin/"
set -ga fish_user_paths "$ANDROID_SDK_ROOT/emulator/"
set -ga fish_user_paths "$ANDROID_SDK_ROOT/tools/"
