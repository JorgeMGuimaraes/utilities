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

batocera-umount () {
    MOUNT_POINT=/media/batocera

    doas umount $MOUNT_POINT
}

# If device is available, mount it. Otherwise, print error message and exit.
__batocera-mount-check () {
    if doas mount UUID=$1 $2; then
        echo "Batocera device mounted."
    else
        echo "Batocera device not found. Exiting..."
        exit 1
    fi
}

batocera-mount () {
    MOUNT_POINT=/media/batocera
    UUID="fe7f3a6f-80c1-4dd7-818e-a591e38beb6f"

    __batocera-mount-check $UUID $MOUNT_POINT
}

batocera-copy () {
    MOUNT_POINT=/media/batocera
    UUID="fe7f3a6f-80c1-4dd7-818e-a591e38beb6f"
    TARGET_DIR=/media/batocera/temp
    SOURCE_DIR=/data/games/to_batocera
    echo "Mounting Batocera device..."
    __batocera-mount-check $UUID $MOUNT_POINT
    echo "Copying files to $TARGET_DIR ..."
    doas cp -R $SOURCE_DIR/* $TARGET_DIR/
    doas umount $MOUNT_POINT
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

vm-dump () {
    doas virsh list --all
    vared -p 'Enter Virtual Machine Name: ' -c DOMAIN
    vared -p 'Enter target directory: ' -c DIR
    doas virsh dumpxml --domain $DOMAIN > $DIR/$DOMAIN.xml
}