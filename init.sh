#!/usr/bin/env bash

# wget https://github.com/pirj/dotfiles/archive/master.zip | unzip -c ?
git clone --depth=1 https://github.com/pirj/plug-repo.git
mv plug-repo/bin .
mv plug-repo/info .
mv plug-repo/id_plug-repo_public.pub .
rm -rf plug-repo

mkdir -p -m 700 .ssh
touch .ssh/authorized_keys
chmod 600 .ssh/authorized_keys
PUBLIC_PUBKEY=$(<id_plug-repo_public.pub)
OWNER_PUBKEY=$(<owner.pub)
cat <<OwnerAndPublic > .ssh/authorized_keys
no-agent-forwarding,no-port-forwarding,no-pty,no-user-rc,no-X11-forwarding,command="bin/access/public \$SSH_ORIGINAL_COMMAND" $PUBLIC_PUBKEY
no-agent-forwarding,no-port-forwarding,no-pty,no-user-rc,no-X11-forwarding,command="bin/access/owner \$SSH_ORIGINAL_COMMAND" $OWNER_PUBKEY
OwnerAndPublic

mkdir -p repo
