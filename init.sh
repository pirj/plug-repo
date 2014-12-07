#!/usr/bin/env bash

# wget https://github.com/pirj/dotfiles/archive/master.zip | unzip -c ?
git clone --depth=1 https://github.com/pirj/plug-repo.git
mv plug-repo/* .
rm -rf plug-repo

mkdir -p -m 700 .ssh
touch .ssh/authorized_keys
chmod 600 .ssh/authorized_keys
OWNER_PUBKEY=$(<owner.pub)

echo <<OwnerAndPublic > .ssh/authorized_keys
no-agent-forwarding,no-port-forwarding,no-pty,no-user-rc,no-X11-forwarding,command="bin/access/public \$SSH_ORIGINAL_COMMAND" ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICCK1i7GAIEE7e0b+8lcaiUkKDmcMZk2hbSXcGnxd08a public@anyone
no-agent-forwarding,no-port-forwarding,no-pty,no-user-rc,no-X11-forwarding,command="bin/access/owner \$SSH_ORIGINAL_COMMAND" $OWNER_PUBKEY
OwnerAndPublic

mkdir -p repo
