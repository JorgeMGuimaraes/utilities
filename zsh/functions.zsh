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

## Batocera
batocera-mount () {
    MOUNT_POINT=/media/batocera
    UUID="fe7f3a6f-80c1-4dd7-818e-a591e38beb6f"

    doas mount UUID=$UUID $MOUNT_POINT
}

batocera-umount () {
    MOUNT_POINT=/media/batocera

    doas umount $MOUNT_POINT
}

batocera-copy () {
    TARGER_DIR=/media/batocera/temp

    doas cp -R $1 $TARGER_DIR
}

## Ubuntu
ubuntu-mount () {
    MOUNT_POINT=/media/ubuntu
    UUID="06ae36e6-abad-4e9e-a4b6-5e17a1c2ad16"

    doas mount UUID=$UUID $MOUNT_POINT
}

ubuntu-umount () {
    MOUNT_POINT=/media/ubuntu

    doas umount $MOUNT_POINT
}
