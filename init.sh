#!/usr/bin/env bash

HEAD=master
#!/usr/bin/env bash

mkdir -p -m 700 .ssh
touch .ssh/authorized_keys
chmod 600 .ssh/authorized_keys
PUBLIC_PUBKEY=$(<id_plug-repo_public.pub)
OWNER_PUBKEY=$(<id_owner.pub)
cat <<OwnerAndPublic > .ssh/authorized_keys
no-agent-forwarding,no-port-forwarding,no-pty,no-user-rc,no-X11-forwarding,command="bin/access/public \$SSH_ORIGINAL_COMMAND" $PUBLIC_PUBKEY
no-agent-forwarding,no-port-forwarding,no-pty,no-user-rc,no-X11-forwarding,command="bin/access/owner \$SSH_ORIGINAL_COMMAND" $OWNER_PUBKEY
OwnerAndPublic

mkdir -p repo
wget -O - https://github.com/pirj/plug-repo/archive/$HEAD.tar.gz | tar -xz
mv plug-repo-$head/bin .
mv plug-repo-$head/id_plug-repo_public.pub .
mv plug-repo-$head/bootstrap.sh .
rm -rf plug-repo-$HEAD

./bootstrap.sh
