# Plugin repository

This is and SSH based and command line controlled plugin repository.

## Rationale

Most plugin repositories are web-first, while this is usually overkill.

SSH is powerful enough to perform authentication and easy to build authorization around it.

Easy to install. No database or fancy tools required.

## Synopsis

As collaborator:

    $ pr tcsh publish colorize-output https://github.com/pirj/tcsh-colorize-output.git
    $ pr tcsh rm colorize-output

As user:

    $ pr tcsh add tcsh.plug-repo.net
    $ pr tcsh info
    $ pr tcsh ls
    $ pr tcsh fetch colorize-output
    $ pr tcsh register

As owner:

    $ pr tcsh collab john-doe@no-panties.org
    $ pr tcsh uncollab someone-you-thought-you-can-trust@traitor.net

## Installation

    $ scp ~/.ssh/id_rsa.pub your-plugin-repo-host:~
    $ ssh your-plugin-repo-host
    $ sudo useradd -mU plug-repo
    $ sudo mv id_rsa.pub /home/plug-repo/owner.pub
    $ sudo chown plug-repo:plug-repo /home/plug-repo/owner.pub
    $ sudo su - plug-repo
    $ curl https://raw.githubusercontent.com/pirj/plug-repo/master/init.sh | bash -s
    $ edit info

## What about command line client?

You can use plain SSH client:

    $ ssh plug-repo@tcsh.plug-repo.net info

Or a [convenience wrapper](https://github.com/pirj/plug-repo-client):

    $ pr tcsh info

## Is it any good?

[Yes](https://news.ycombinator.com/item?id=3067434).

## Author

Philipp Pirozhkov
pirjsuka at gmail com
