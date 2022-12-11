#! /bin/bash
#description: Generates a new key based on some standards
#   - type ed25519, 256 rounds
#   - hostname at the end of file
#
# Also, change key pair permissions and print instructions on how to set the server
# Based on:
# https://cryptsus.com/blog/how-to-secure-your-ssh-server-with-public-key-elliptic-curve-ed25519-crypto.html

#--- Variables ---#
OWNER_RWE=700
OWNER_R=400

SSH_DIR_S=~/.ssh
SSH_DIR_L=/home/$USER/.ssh
SSH_FILE=id_ed25519

#--- Main program ---#
echo "Generating ellyptic key..."
ssh-keygen \
  -o \
  -a 256 \
  -t ed25519 \
  -C "$(whoami)@$(hostname)"

echo "\nMake the .ssh directory unreadable for other users and groups..."
chmod $OWNER_RWE $SSH_DIR_S
chmod $OWNER_RWE /home/$USER/.ssh

echo "Make the private SSH key read only..."
chmod $OWNER_R $SSH_DIR_L/$SSH_FILE
chmod $OWNER_R $SSH_DIR_S/$SSH_FILE

echo "Make $USER own the SSH key pair files..."
chown $USER:$USER $SSH_DIR_S/$SSH_FILE*
chown $USER:$USER $SSH_DIR_L/$SSH_FILE*

echo "\nServer side actions:\n"
echo "rm /etc/ssh/ssh_host_* 						#Delete old SSH keys"
echo "rm ~/.ssh/id_* 							    #Delete old SSH keys"
echo "sudo dpkg-reconfigure openssh-server			#Reset SSH config to defaults and generate new key files"
echo "rm /home/\$USER/.ssh/id_*     				#Delete old SSH keys"
echo "vi /home/\$USER/.ssh/authorized_keys			#paste public key here"
echo "cd /home/\$USER/ && chmod g-w,o-w .ssh/		#The directory containing your .ssh directory must not be writeable by group or others"
echo "chmod 600 /home/\$USER/.ssh/authorized_keys   #change permissions to r+w only for user"
echo "service sshd restart						    #restart and reload keys into the SSH deamon"
