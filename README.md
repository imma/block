Blocks
======

Blocks are just git repositories; an empty repo is a minimal block.  How
blocks fit with each other depend on file-name signatures.

# Configuration

    script/profile

Bash shells can source `profile` to make use of a block.  Most
configuration is environment variables and the side-effects it
represents.

    script/rc

Shell functions aren't inherited by sub-shells, so they have to be
loaded at every shell in `rc`; `profile` should load `rc`.

# Builds

    script/bootstrap

To download, build, and setup the block, `bootstrap` is run.  It can be
any executable script.  `bootstrap` is a basic script that is called by
higher level processes such as `update`.  

For example, a block's language and OS packages that the block depends
on are installed here, but configuration on how to use the block are
taken care of in `update`.

    script/stale

To avoid running `bootstrap` needlessly, and to keep it simple, `stale`
detects when `bootstrap` should be run.  Version information can be
checked here to indicate out of date builds.

An alternative to `stale` is `fresh`.  Might be easier to write a
`fresh` script.

    script/clean

Cleaning the build area is handled by `clean` which should cause `stale`
to return true, and allow `bootstrap` to build from scratch.

    script/update

When a project is updated (git pulls, local edits), `script/update` is
run.  It calls `bootstrap` to build the block, and updates services,
resources that support the block.  

For example, if a service is run out of the block, configuration
management can be run to regenerate files, restart services.  `update`
does not refer to source code management; that's the responsibility of
`git`.

