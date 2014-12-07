# Plugin repository

This is and SSH based and command line controlled plugin repository.

## Rationale

Most plugin repositories are web-first, while this is usually overkill.
SSH is powerful enough to perform authentication and easy to build authorization around it.
Easy to install. No database or fancy tools required.

## Synopsis

As collaborator:

    $ pr publish tcsh colorize-output https://github.com/pirj/tcsh-colorize-output.git
    $ pr rm tcsh colorize-output

As user:

    $ pr add tcsh tcsh.plug-repo.net
    $ pr info tcsh
    $ pr ls tcsh
    $ pr fetch tcsh colorize-output
    $ pr register tcsh

As owner:

    $ pr collab john-doe@no-panties.org
    $ pr uncollab someone-you-thought-you-can-trust@traitor.net

## Installation

    $ scp ~/.ssh/id_rsa.pub your-plugin-repo-host:~
    $ ssh your-plugin-repo-host
    $ sudo useradd -mU plug-repo
    $ sudo mv id_rsa.pub /home/plug-repo/owner.pub
    $ sudo chown plug-repo:plug-repo /home/plug-repo/owner.pub
    $ sudo su - plug-repo
    $ curl https://raw.githubusercontent.com/pirj/plug-repo/master/init.sh | bash -s
    $ edit info

## Is it any good?

[Yes](https://news.ycombinator.com/item?id=3067434).

## Author

Philipp Pirozhkov
pirjsuka at gmail com
