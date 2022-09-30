###################################
#### Functions
###################################

# Copy to Oh My Zsh Custom
# $ cp functions.zsh $ZSH_CUSTOM/

wa () {
    echo "https://wa.me/$1"
}

uuid () {
    python3 -c 'import uuid; print(str(uuid.uuid4()))'
}