# versiontag

Bash command to automate tagging with semantic versioning in a git repository.

Current version: v2.1.0

## Features

Allow easy maintenance of semantic versioning in git projects.

Since 1.4.2 supports .semver file writing.

Since 2.0.0 tags are not annotated by default. You must use the option `-m` or `--message` to annotate the tag.

## Commands

`help` - Shows a help  
`current` - Shows the last version tag found. If there is none it defaults to `v0.0.0`    
`patch` - Increases patch version: `v1.0.0 -> v1.0.1`  
`minor` - Increases minor version (and resets patch): `v1.0.5 -> v1.1.0`  
`major` - Increases major version (and resets minor and patch): `v1.3.4 -> v2.0.0`  
`remove` - Removes the last tag in the repository. This command doesn't support the `-f|--force` option.  

## Options

`-h|--help` - Shows help.  
`-f|--force` - Script won't ask for confirmation.  
`-d|--dry` - Executes without perform any change.  
`-m|--message` - Annotates the tag with the message.  
`-s|--semver` - Generates the .semver file.  

## Installation

* Copy the script to the place you want. Best in your `$PATH`.
* Make it executable if needed.
* There is no step three, I guess.

If you want to install it on your Linux or Mac OS X machine, use:

```bash
sudo curl -L \
https://raw.githubusercontent.com/franiglesias/versiontag/master/versiontag \
-o /usr/local/bin/versiontag \
&& sudo chmod +x /usr/local/bin/versiontag \
&& versiontag help
```

## Tests

Tests should help you to understand how **versiontag** works and to modify the code without breaking functionality. More tests are coming soon.

Run the tests with the following command. 

```bash
bash testCases/testAll.sh
```

## Known limitations

You should update your master before running `versiontag` in order to get the latest tags from the remote repo. 

## Contributors

Feel free to suggest improvements and ideas. 

A big thank you to:

[Patrik Kristian](https://github.com/pkristian): 

* Tests
* Linux installation instructions
* Several code improvements

 [Javier Ferrer](https://github.com/JavierCane)
 
 * Suggested .semver file
 
Your name here ;-)

## Basic usage

```
$ versiontag patch|minor|major [-m 'Tag message']
```

The command will show current and updated version and will prompt you to create the tag in the local version.

After that, it will prompt you to push the tag to remote repository.

That's all.

## Examples

Show current version

```bash
$ versiontag current
```

Generate .semver for current version

```bash
$ versiontag current --semver
```


Patch version

```bash
$ versiontag patch -m 'Fix broken view'
```

Force patch version without annotation

```bash
$ versiontag --force patch
```
Minor version with message option

```bash
$ versiontag minor --message 'Add Customer filter by email'
```

Major version

```bash
$ versiontag major -m 'Blog module'
```

Remove last tag

```bash
$ versiontag remove
```
