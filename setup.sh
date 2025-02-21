#!/bin/zsh

# ┌────────────────────────────────────────────────────────────┐
# │                                                            │
# │    Dotfiles installer                                      │
# │                                                            │
# └────────────────────────────────────────────────────────────┘


cp ~/.zshrc ~/.zshrc-backup-$(date +%Y%m%d_%H%M%S) # backup
cp ./.zshrc ~/.zshrc 
source ~/.zshrc  
dotfiles-to-local
