# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="powerlevel10k/powerlevel10k"
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Disable marking untracked files under VCS as dirty.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Custom source scripts
ZSH_CUSTOM="$HOME/.zsh_custom"

# Extended glob
setopt extendedglob

# Plugins
plugins=(
    git
    z
    docker
    osx
    web-search
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-vim-mode
)

source $ZSH/oh-my-zsh.sh

# ************************ User configuration **********************************

# Keybinds
bindkey -v
bindkey '^ ' autosuggest-accept
export VISUAL=$EDITOR
autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd V edit-command-line

# pyenv
eval "$(pyenv init -)"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# Agave Bash CLI
export PATH="$PATH:$HOME/sd2e-cloud-cli/bin"

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# iTerm shell integration

# iTerm shell integration
ITERM_SH_INTEGRATION="$HOME/.itermrc/shell_integration/iterm2_shell_integration.zsh"
[[ ! -f $ITERM_SH_INTEGRATION ]] || source $ITERM_SH_INTEGRATION
