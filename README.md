# Plugin repository

This is and SSH based and command line controlled plugin repository.

## Rationale

Most plugin repositories are web-first, while this is usually overkill.

SSH is powerful enough to perform authentication and easy to build authorization around it.

Easy to install. No database or fancy tools required.

## Synopsis

As user:

    $ pr tcsh add tcsh.plug-repo.net
    Repository tcsh added
    $ pr tcsh info
    TCSH plugins repo
    Owner: Kimmo Suominen
    $ pr tcsh ls
    colorize-output Fancy colors in your shell
    enlarge-your-history More entries in history
    $ pr tcsh fetch colorize-output
    colorize-output is fetched to ~/.tcsh/plugins
    $ pr tcsh register
    Membership request is sent to tcsh

As collaborator:

    $ pr tcsh publish colorize-output https://github.com/pirj/tcsh-colorize-output.git
    colorize-output added to tcsh
    $ pr tcsh rm colorize-output
    colorize-output removed from tcsh

As owner:

    $ pr tcsh collab john-doe@no-panties.org
    john-doe is added as a collaborator to tcsh
    $ pr tcsh uncollab someone-you-thought-you-can-trust@traitor.net
    someone-you-thought-you-can-trust is removed from collaborators in tcsh

## Installation

    $ scp ~/.ssh/id_rsa.pub your-plugin-repo-host:~
    $ ssh your-plugin-repo-host
    $ sudo useradd -mU plug-repo
    $ sudo mv id_rsa.pub /home/plug-repo/owner.pub
    $ sudo chown plug-repo:plug-repo /home/plug-repo/owner.pub
    $ sudo su - plug-repo
    $ curl https://raw.githubusercontent.com/pirj/plug-repo/master/init.sh | bash -s
    $ edit info

## How to access repository we have just deployed

You can use plain SSH client. For public access you will need a public keypair (id\_plug-repo\_public). You should put it to your ~/.ssh folder, or edit your ~/.ssh/config, or use a dedicated ssh\_config file.

    $ ssh plug-repo@tcsh.plug-repo.net info

Or a [convenience wrapper](https://github.com/pirj/plug-repo-client):

    $ pr tcsh info

## Is it any good?

[Yes](https://news.ycombinator.com/item?id=3067434).

## Author

Philipp Pirozhkov
pirjsuka at gmail com
