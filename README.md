This is a simple but sometimes very useful tool. If you pass 2 yaml files it will compare them and show the keys of the first file that the second file is missing.

That can be handy if you develop a multilingual application and your translations are stored in yaml files. An example is a Rails framework with yaml files for every language (em.yml, ru.yml...). Many other apps use this approach too.

## Usage

You can use it from the command line:
```
differz --help
```

GLOBAL OPTIONS

`--help` - Show all the arguments and commands

`--version` - Display the program version


COMMANDS

`edit` - Allows you to fill missing keys in yaml file

`help` - Shows a list of commands or help for one command

`show` - Only show the difference between yaml-files without editing them


For the `show` and `edit` commands you have to pass at least two arguments: paths for yaml files that should be compared. Here is an example of usage:
```
differz show file1.yml file2.yml
```

As a result, you will see all the keys from file1.yml that are missing in file2.yml. The result will be shown in format like this:
```
en -> main -> label
en -> main -> text
...
level1 -> level2 -> level3...
```
