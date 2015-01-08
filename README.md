# Plugin repository

SSH frontend to plugin repository.

## Rationale

Most plugin repositories are web-first, this is overkill.

SSH is powerful enough to perform authentication and easy to build authorization around it.

Easy to install. No database or fancy tools required.

## Synopsis

    $ pr tcsh add tcsh.plug-repo.net
    Repository tcsh added
    $ pr tcsh ls
    colorize-output Fancy colors in your shell
    enlarge-your-history More entries in history
    $ pr tcsh fetch colorize-output
    colorize-output is fetched to ~/.tcsh/plugins

With change permissions:

    $ pr tcsh publish colorize-output https://github.com/pirj/tcsh-colorize-output.git
    colorize-output added to tcsh
    $ pr tcsh rm colorize-output
    colorize-output removed from tcsh

## Installation

Copy your 'owner' public key and log in to target machine:

    $ scp ~/.ssh/id_rsa.pub your-host:~
    $ ssh your-host

Create a user (the will be the user other will 'log in' to, e.g. `ssh plug-repo@your-host`):

    $ sudo useradd -mU plug-repo

Move the key so that installer can find it:

    $ sudo mv id_rsa.pub /home/plug-repo/id_owner.pub
    $ sudo chown plug-repo:plug-repo /home/plug-repo/id_owner.pub

Install to user directory:

    $ sudo su - plug-repo
    $ wget -O - https://raw.githubusercontent.com/pirj/plug-repo/master/init.sh | bash -s

Edit repository information, its contents will be returned to those asking for repository info:

    $ edit info

Do not forget to start SSH server.

## How to access repository we have just deployed

You can use plain SSH client. For public access you will need a public keypair (id\_plug-repo\_public). You should put it to your ~/.ssh directory, or edit your ~/.ssh/config, or use a dedicated ssh\_config file.

    $ ssh plug-repo@tcsh.plug-repo.net info

Or a [convenience wrapper](https://github.com/pirj/plug-repo-client):

    $ pr tcsh info

## Is it any good?

[Yes](https://news.ycombinator.com/item?id=3067434).

## Contribute

1. Fork
2. Fix/extend
3. Add test and make sure they pass
4. Send pull request

### Testing

Prerequisites:

  - [proot](http://proot.me) (userspace chroot)
  - [expect](http://www.nist.gov/el/msid/expect.cfm) (test expectations)

proot is Linux only, so is fakechroot. Probably it makes sense to use chroot on BSDs and OSX.
I discourage you from using Vagrant, VirtualBox, LXC, Docker and other ugly monsters for simple task of testing an SSH server in isolation.

Tests are being run using userland chroot and a local sshd server on port 2222.
/home/plug-repo directory is bound to sandbox/home/plug-repo and is wiped out between test runs.
/etc/ssh is bound to test/etc/ssh so that you can experiment with sshd\_config.

Run:

    test/run

## What works to date

Authentication.

Authorization (public anonymous user, owner, collaborator).

Plugin (creation/modification, removal, query).

Repository info file.

## FAQ

No questions asked so far. Putting things that I use to forget here:

Q: Plugins for what?

A: Machine-local tools (zsh, vim, git, tmux, bash, weechat), project-local (capistrano, authlogic, grunt, angular). They all have dozen useful plugins you probably never heard of.


Q: How does it work?

A: That's easy and complicated at the same time. Some binary files are being executed with some parameters when someone logs in via SSH, and their output is sent back to client.


Q: Will there be a desktop GUI front-end or web UI?

A: Sure, when someone writes them. Something that accepts manually filled in signed forms and issues printed tickets whith download links is a good idea too.


Q: Doesn't each and every of them already have some kind of a repository?

A: Here comes the ugly list of different kinds of plugins repositories (where only the one for sublime and unheap are neat).


Q: What are those PKI pairs all around the project?

A: There are three of them:

1. id\_plug-repo\_public. SSH does not have an option to run a command on a server side when user is not authenticated at all. We use that pair of keys for all of that public users out there.
2. test/id\_owner. This pair is only used during development tests, you are free to replace them. It simulate the keypair of the owner of repository.
3. test/etc/ssh/ssh\_host\_ed25519\_key. This pair is only used during development tests, you are free to replace them. It simulate the keypair of the server.

## Author

Philipp Pirozhkov pirjsuka at gmail com
