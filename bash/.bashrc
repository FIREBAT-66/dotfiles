# ~/.bashrc
#
# Initialize zoxide
eval "$(zoxide init bash)"
# Initialize broot
source /home/wytchfyre/.config/broot/launcher/bash/br

# Function to return the size of the git repo
gc(){
  echo "|.git| = $(du -s .git)"
} 

locate(){
ls -a | fzf --bind='ctrl-d:change-prompt(directories: )+reload(find . -type d)' --bind='ctrl-f:change-prompt(files: )+reload(find . -type f)' --header 'ctrl-d (directory_search) / ctrl-f (file_search)'
}

# Bind Alt+B to insert 'br' and press Enter (newline)
bind '"\ee": "br\n"'

# fl() {
#     local selected_dir
#     selected_dir=$(fzf --reverse --height=50% < <(find . -type d))
#     if [[ -n "$selected_dir" ]]; then
#         cd "$selected_dir" && wl-copy "$selected_dir"
#     fi
# }
#
# # [F]ind [F]ile: Generate all files from current working directory and pipe to fzf, selecting in fzf utilizes xdg-open to access the file
# ff() {
#     local selected_file
#     selected_file=$(find . -type f | fzf --reverse --height=50%)
#     if [[ -n "$selected_file" ]]; then
#         xdg-open "$selected_file" && wl-copy "$selected_file"
#     fi
# }

find_excluding_dir() {
  # ... argument checking omitted for brevity ...
  local dir_path="$1"
  local exclude_name="$2"

  # The find command
  find "$dir_path" -not -path "*/$exclude_name*" -depth -print
}


# Opens an fzf serach of pdfs in the ghostnation pdfs directory
pdfs(){

    # Save the current directory and change to the new one
    pushd /run/media/wytchfyre/ghostnation/repositories/pdf_data > /dev/null

    # Run the command
    local selected_file
    selected_file=$(find /run/media/wytchfyre/ghostnation/repositories/pdf_data -type f | fzf --reverse --height=50%)
    if [[ -n "$selected_file" ]]; then
       sioyek "$selected_file" >/dev/null 2>&1 &
       
    fi

    # Return to the previous directory
    popd > /dev/null

}

# Opens gemini-cli via npx
gemini(){

	npx https://github.com/google-gemini/gemini-cli

}


export EDITOR="nvim"
export TMPDIR=/tmp
# export TERM="kitty"
# export NVIM_APPNAME= 
export TERMINAL="kitty"
export TMUX_NEST_COUNT=1
export XDG_CONFIG_HOME="$HOME/.config"
# export BROOT_LOG=debug broot


if [ -n "$TMUX" ]; then
    echo "Reattaching to main session"
    return
fi

if tmux ls &>/dev/null; then
    tmux attach -t "$(tmux ls -F '#S' | head -n 1)"
else
    tmux new -s FIREBAT
fi



# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# Autojumps test mechanism and initialization
# [[ -s /home/wytchfyre/.autojump/etc/profile.d/autojump.sh ]] && source /home/wytchfyre/.autojump/etc/profile.d/autojump.sh
export EDITOR="nvim"
export PATH="/home/wytchfyre/.local/bin/:$PATH"
export PATH="/home/wytchfyre/.cargo/bin:$PATH"

# >>> conda initialize >>>

# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/home/wytchfyre/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/home/wytchfyre/anaconda3/etc/profile.d/conda.sh" ]; then
#         . "/home/wytchfyre/anaconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/home/wytchfyre/anaconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup

# <<< conda initialize <<<

# alias ff="cd $(find /run/media/wytchfyre/ghostnation/ | fzf)"
# fl() { cd $(find /run/media/wytchfyre/ghostnation/ | fzf); }
# fl() { cd $(find . -type d | fzf); }
# ff() { xdg-open $(find /run/media/wytchfyre/ghostnation/ | fzf); }
 # ff() { xdg-open "$(find . -type f | fzf)"; }

# [F]ind [L]ocation: Generate all directories from current working directory and pipe to fzf, changing into the directory and copying the directory path to the buffer
# fl() {
#     local selected_dir
#     selected_dir=$(find . -type d | fzf --reverse --height=50%)
#     if [[ -n "$selected_dir" ]]; then
#         cd "$selected_dir" && wl-copy "$selected_dir"
#     fi
# }


# [F]ind [H]istory: Function to pipe history to fzf and execute on selection
fh() {
  selected=$(history | fzf --reverse --height=50% --preview "echo {} | cut -c 8- | bat --color=always --line-range :100" | cut -c 8-)
  # selected=$(history | fzf --reverse --height=50% --preview "echo {} | cut -c 8- | bat --color=always --line-range :100" | cut -c 8-)

  if [[ -n "$selected" ]]; then
    echo "$selected"
    eval "$selected"
  fi
}

# If keybind is desired, the following bind links to CTRL+H
# bind -x '"\C-h": fzf-history-search'

# Function to run Vieb
vieb() {
    # Save the current directory and change to the new one
    pushd /home/wytchfyre/repositories/Vieb > /dev/null

    # Run the command
    npm start &

    # Return to the previous directory
    popd > /dev/null
}

# Function to attach to a tmux session
# Usage: attach <session_name_or_number>
attach() {
    tmux attach -t "$1"
}

# Function to create a new tmux session
tm() {
    if [ -n "$TMUX" ]; then
        echo "Already inside tmux."
        return
    fi

    if tmux ls &>/dev/null; then
        tmux attach -t "$(tmux ls -F '#S' | head -n 1)"
    else
        tmux new -s main
    fi
}









# Generates the default git commit text

  
# Auto-execute commnds here
# tm



