# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Se ainda nao tiver o plugin manager na maquina
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

#--------------------------------------------------

# Inicializa o Zinit com Aliases do Oh-My-Posh
source "${ZINIT_HOME}/zinit.zsh"
export PATH=$PATH:/home/poc/.local/bin

#--------------------------------------------------

# Plugins
zinit light zsh-users/zsh-syntax-highlighting # Syntax
zinit light zsh-users/zsh-completions # Completions
zinit light zsh-user/zsh-autosuggestions # Sugestões do histórico 
zinit light Aloxaf/fzf-tab

#--------------------------------------------------

# Snippets
# OMZP - Oh my zshell plugins. 
zinit snippet OMZP::git                 # aliases do git
zinit snippet OMZP::sudo                # adiciona o sudo ao apertar duas vezes o esc
zinit snippet OMZP::command-not-found   # Recomendação de pacote para ser instalado

#--------------------------------------------------

# Load Completions
autoload -U compinit && compinit

zinit cdreplay -q # replay all cached completions

#--------------------------------------------------

# Tema do Oh-My-Posh
eval "$(oh-my-posh init zsh --config 'night-owl')"

#--------------------------------------------------

# Keybindings
bindkey '^ ' autosuggest-accept         # ctrl+space: aceitar sugestão
bindkey '^p' history-search-backward    # ctrl+p: voltar no histórico do mesmo prefixo
bindkey '^n' history-search-forward     # ctrl+n: avançar no histórico do mesmo prefixo

#--------------------------------------------------

# Histórico
HISTSIZE=5000               # Tamanho do histórico
HISTFILE=~/.zsh_history     # Lugar onde guardará o histórico
SAVEHIST=$HISTSIZE
HISTDUP=erase               # Apaga comandos duplicados
setopt appendhistory        # Adiciona os comandos no histórico
setopt sharehistory         # Compartilha o histórico com todas as seções do zsh
setopt hist_ignore_space    # Não salvará comandos que começa com espaço, bom para segurança
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups    # Impede que apareça comandos duplicados

#--------------------------------------------------

# Completion styling 
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'  # case-insensitive
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} # set list-colors to enable filename colorizing
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls -1 --color=always $realpath' # Preview do diretório com ls

#--------------------------------------------------

# Aliases
alias ls='ls --color' 
alias lasl='ls -al'
alias ff='fastfetch'

#--------------------------------------------------

# Shell integrations
eval "$(fzf --zsh)"