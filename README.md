# versiontag

Bash command to automate tag semantic versioning in a git repository.

## Commands

`help` - Shows a help
`current` - Shows the last version tag found. If there is none it defaults to `v0.0.0`  
`patch` - Increases patch version: `v1.0.0 -> v1.0.1`  
`minor` - Increases minor version (and resets patch): `v1.0.5 -> v1.1.0`  
`major` - Increases major version (and resets minor and patch): `v1.3.4 -> v2.0.0`  
`remove` - Removes the last tag in the repository. This command doesn't support the `-f|--force` option.

## Options
`-f|--force` - Script won't ask for confirmation.

## Installation

* Copy the script to the place you want. Best in your $PATH.
* Make it executable if needed.
* There is no step three, I guess.

If you want to install it on your linux machine, use:
```bash
sudo curl -L \
https://raw.githubusercontent.com/franiglesias/versiontag/master/versiontag \
-o /usr/local/bin/versiontag \
&& sudo chmod +x /usr/local/bin/versiontag \
&& versiontag help
```
## Known limitations

You should update your master before running `versiontag` in order to get the latests tags from the remote repo. 

## Basic usage

```
./versiontag patch|minor|major 'Tag message'
```

The command will show current and updated version and will prompt you to create the tag in the local version.

After that, it will prompt you to push the tag to remote repository.

That's all.

This is an example of the full interaction to tag the first version of version tag (sort of auto-referencing)

```bash
➜  versiontag git:(master) ./versiontag major "First usable version"
fatal: No names found, cannot describe anything.
Current version : v0.0.0
New tag         : v1.0.0
Do you agree? ([y]es or [N]o): y

Executing git tag -a v1.0.0 -m First usable version (major version) ...


Tag v1.0.0 was created in local repository.

Push it:

    git push origin v1.0.0

Delete tag:

    git tag -d v1.0.0

Do you want to push this tag right now? ([y]es or [N]o): y

Executing git push origin v1.0.0 ...

Counting objects: 1, done.
Writing objects: 100% (1/1), 179 bytes | 179.00 KiB/s, done.
Total 1 (delta 0), reused 0 (delta 0)
To https://github.com/franiglesias/versiontag
 * [new tag]         v1.0.0 -> v1.0.0
```

## Examples

Show current version

```bash
./versiontag current
```

Patch version

```bash
./versiontag patch 'Fix broken view'
```

Force patch version

```bash
./versiontag patch 'Fix broken view' --force
```

Minor version

```bash
./versiontag minor 'Add Customer filter by email'
```

Major version

```bash
./versiontag major 'Blog module'
```

Remove last tag

```bash
./versiontag remove
```
