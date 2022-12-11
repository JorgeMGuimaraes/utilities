#! /bin/bash


#--------------------------------------------------#
# Variaveis
#--------------------------------------------------#
DEST=~/.oh-my-zsh/custom
declare -a ZSH_FILES=( 'alias.zsh' 'functions.zsh' 'places.zsh' )
LENGHT=${#ZSH_FILES[@]}

#--------------------------------------------------#
# Acoes
#--------------------------------------------------#
for (( j=0; j<${LENGHT}; j++ ));
do
  echo "Creating link from $(pwd)/${ZSH_FILES[$j]} to  $DEST/${ZSH_FILES[$j]}"
  ln -s $(pwd)/${ZSH_FILES[$j]} $DEST/${ZSH_FILES[$j]}
done
