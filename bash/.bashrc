# ==============================================================================
#
#        STANDALONE POWERLINE-NAKED PROMPT (WITH DETAILED GIT INFO)
#
# ==============================================================================
#
# DISCLAIMER:
#
# PORTIONS OF THIS CODE WAS INSPIRED BY/CUT-PASTED FROM GIT-PROMPT.SH, 
######### Copyright (C) 2006,2007 Shawn O. Pearce <spearce@spearce.org>
######### Distributed under the GNU General Public License, version 2.0.
#
# PORTIONS OF THIS CODE WERE ALSO INSPIRED BY THE OH-MY-BASH FRAMEWORK (OMB) 
# WHICH IS LICENSED UNDER THE MIT LICENSE BY Robby Russell (2009-2017), Toan Nguyen (2017-present)
# AND THE RESPECTIVE CONTRIBUTORS.
######### https://raw.githubusercontent.com/ohmybash/oh-my-bash/refs/heads/master/LICENSE.md
#
# ------------------------------------------------------------------------------
# Part 1: Main Configuration -- Tweak your prompt's look and feel here!
# ------------------------------------------------------------------------------

# --- Powerline Elements ---
# The separator between segments. '' requires a Nerd Font. Use '|' or '>' if you don't have one.
POWERLINE_SEPARATOR='>'

# Define the order of segments on the prompt.
# CHANGED: Reordered to your preference.
PROMPT_SEGMENTS=(
  user_info
  git
  dir
  python_venv
)

# --- Colors ---
C_RESET='\[\033[0m\]'
C_USER_INFO='\[\033[0;32m\]'         # Green
C_DIR='\[\033[0;34m\]'               # Blue
C_GIT_BRANCH='\[\033[0;36m\]'        # Cyan for the branch info
C_GIT_STATUS='\[\033[0;33m\]'        # Yellow for status counts
C_PYTHON_VENV='\[\033[0;33m\]'       # Yellow
C_LAST_STATUS_ERROR='\[\033[0;31m\]' # Red

# --- Git Status Format & Icons ---
# CHANGED: New icons to match your desired format.
GIT_PROMPT_BRANCH_ICON=" "
GIT_PROMPT_AHEAD_ICON="↑"
GIT_PROMPT_BEHIND_ICON="↓"
GIT_PROMPT_DIVERGED_ICON="↕"
GIT_PROMPT_UNTRACKED_ICON="U:"
GIT_PROMPT_STAGED_ICON="S:"
GIT_PROMPT_MODIFIED_ICON="M:"

# --- Python Virtualenv ---
PYTHON_VENV_CHAR="🐍 "

# ------------------------------------------------------------------------------
# Part 2: Prompt Logic -- (Should not require editing)
# ------------------------------------------------------------------------------

# --- Segment: User Information ---
get_user_info_segment() {
  if [[ -n "$SSH_CLIENT" ]]; then
    echo -n "${C_USER_INFO}\u@\h${C_RESET}"
  elif [ -f "/run/.toolboxenv" ] && [ -f "/run/.containerenv" ]; then
    local toolbx_name
    toolbx_name=$(grep -E '^name="' /run/.containerenv | cut -d '"' -f 2)
    echo -n "${C_USER_INFO}\u@${toolbx_name}${C_RESET}"
  else
    echo -n "${C_USER_INFO}\u${C_RESET}"
  fi
}

# --- Segment: Current Directory ---
get_dir_segment() {
  echo -n "${C_DIR}\w${C_RESET}"
}

# --- Segment: Python Virtual Environment ---
get_python_venv_segment() {
  local venv=""
  if [[ -n "$CONDA_DEFAULT_ENV" ]]; then venv="$CONDA_DEFAULT_ENV";
  elif [[ -n "$VIRTUAL_ENV" ]]; then venv=$(basename "$VIRTUAL_ENV"); fi
  if [[ -n "$venv" ]]; then echo -n "${C_PYTHON_VENV}${PYTHON_VENV_CHAR}${venv}${C_RESET}"; fi
}

# --- Segment: Git Repository Status (detailed) ---
get_git_segment() {
    local git_dir
    git_dir=$(git rev-parse --git-dir 2> /dev/null)
    [ -z "$git_dir" ] && return # Not a git repo

    local branch_name=$(git symbolic-ref --short HEAD 2>/dev/null) || \
                    branch_name=$(git rev-parse --short HEAD 2>/dev/null) || \
                    return # Not on a branch

    local status_string=""

    # Get upstream tracking info
    local upstream_info=$(git rev-list --count --left-right "@{upstream}"...HEAD 2>/dev/null)
    if [[ -n "$upstream_info" ]]; then
        local behind ahead
        behind=$(echo "$upstream_info" | awk '{print $1}')
        ahead=$(echo "$upstream_info" | awk '{print $2}')

        if [[ "$behind" -gt 0 && "$ahead" -gt 0 ]]; then
            status_string+=" ${GIT_PROMPT_DIVERGED_ICON}${behind}${GIT_PROMPT_AHEAD_ICON}${ahead}"
        elif [[ "$ahead" -gt 0 ]]; then
            status_string+=" ${GIT_PROMPT_AHEAD_ICON}${ahead}"
        elif [[ "$behind" -gt 0 ]]; then
            status_string+=" ${GIT_PROMPT_BEHIND_ICON}${behind}"
        fi
    fi

    # Get file status counts
    local untracked_count=$(git ls-files --others --exclude-standard --directory --no-empty-directory | wc -l | tr -d ' ')
    local staged_count=$(git diff --name-only --cached | wc -l | tr -d ' ')
    local modified_count=$(git diff --name-only | wc -l | tr -d ' ')
    
    local file_status=""
    if [[ "$untracked_count" -gt 0 ]]; then file_status+=" ${GIT_PROMPT_UNTRACKED_ICON}${untracked_count}"; fi
    if [[ "$staged_count" -gt 0 ]]; then file_status+=" ${GIT_PROMPT_STAGED_ICON}${staged_count}"; fi
    if [[ "$modified_count" -gt 0 ]]; then file_status+=" ${GIT_PROMPT_MODIFIED_ICON}${modified_count}"; fi

    # Assemble the final string
    echo -n "${C_GIT_BRANCH}${GIT_PROMPT_BRANCH_ICON}${branch_name}${C_RESET}${C_GIT_STATUS}${status_string}${file_status}${C_RESET}"
}


# --- Segment: Last command's exit status ---
get_last_status_segment() {
  if [ "$1" -ne 0 ]; then
    echo -n "${C_LAST_STATUS_ERROR}${1}${C_RESET}"
  fi
}

# --- Main Prompt Builder ---
build_prompt() {
  local last_status="$?"
  local prompt_string=""
  local separator=" ${POWERLINE_SEPARATOR} "

  for segment in "${PROMPT_SEGMENTS[@]}"; do
    local segment_output
    segment_output=$(get_"${segment}"_segment)
    if [ -n "$segment_output" ]; then
      [[ -n "$prompt_string" ]] && prompt_string+="$separator"
      prompt_string+="$segment_output"
    fi
  done
  
  local status_output
  status_output=$(get_last_status_segment "$last_status")
  if [ -n "$status_output" ]; then
      [[ -n "$prompt_string" ]] && prompt_string+="$separator"
      prompt_string+="$status_output"
  fi

  PS1="${prompt_string} "
}

# Set the PROMPT_COMMAND to our builder function
export PROMPT_COMMAND=build_prompt

# ------------------------------------------------------------------------------
# Part 3: Colorful Files 
# ------------------------------------------------------------------------------
# ENABLE COLORFUL 'ls' AND COMMON ALIASES

# Enable colors for ls, man, and grep
# This uses the 'dircolors' command to generate a default color theme.
if command -v dircolors &> /dev/null; then
  eval "$(dircolors -b)"
fi

# Set the ls alias to use the colors we just defined
alias ls='ls --color=auto'

# Common useful aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# ------------------------------------------------------------------------------
# Part 4: Personal Customization
# ------------------------------------------------------------------------------

# Set personal aliases and variables.

export TERM=xterm-256color

export LESSEDIT='%E ?lm+%lm. %g'

export EDITOR='nvim'

alias vim="nvim"
alias sh="bash"

alias dotfiles="cd ~/dotfiles"
alias vimrc="nvim ~/dotfiles/nvim/.config/nvim/."
alias mergetool="nvim -c /':G mergetool'"
alias vimdiff='nvim -d'

alias bashrc="nvim ~/.bashrc"
alias bash-reload="source ~/.bashrc"
alias tmux-config="nvim ~/dotfiles/tmux/.config/tmux/tmux.conf"

alias kinit="kdestroy -A; kinit"
alias vpnauto="rm -f ~/.gnupg/public-keys.d/pubring.db.lock; vpnauto"

alias mbox-thread="b4 mbox $1 ~/Mail"
alias mutt-update="lei up --all && neomutt"
alias mutt="neomutt"

alias owners_check="pushd ~/scripts/owners-tools/; git pull; source venv/bin/activate; ./owners_check.py"

format_commits() {  
  sed 's/\s.*$//' $1 | tr -s '\n' ' ' > $2
} 

export -f format_commits
bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'
bind '"\e[Z":menu-complete-backward'

export REQUESTS_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt
export KUBECONFIG=/home/$USER/.kubeconfig.ran-vcl101
export GNOME_KEYRING_CONTROL=/run/user/4209965/keyring/

LOCAL_BIN=/home/$USER/.local/bin

PATH=$PATH:$LOCAL_BIN
. "$HOME/.cargo/env"

