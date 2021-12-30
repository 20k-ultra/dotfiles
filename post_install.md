# Post install steps

These steps are the basic you should perform after provisioning a new Arch machine.

```
# Install sudo and a basic editor
pacman -S sudo vi

# Create a new user
useradd -m -G wheel -s /bin/bash <user> 

# Set password for <user>
passwd <user>

# Edit sudoers file
# Remove the comment in front of the line `wheel ALL=(ALL) ALL`
visudo

# Switch to the new user
su - <user>

# Lock root login
sudo passwd -l root
```

Now you have an account setup with the correct privleges and root login disabled.

Continue dotfiles setup in the [README](README.md).
