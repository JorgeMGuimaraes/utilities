###################################
#### Functions
###################################

# Copy to Oh My Zsh Custom
# $ cp alias.zsh $ZSH_CUSTOM/

wa () {
    echo "https://wa.me/$1"
}

uuid () {
    python3 -c 'import uuid; print(str(uuid.uuid4()))'
}