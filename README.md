scriptease
----------

During my work as an engineer I've needed (and I still do) to set up pipelines and do some quick and dirty jobs multiple times. Bash is a really useful language for such purposes and **scriptease** is just a bunch of scripts that anyone can use.

### Available Scripts

The essential scripts I have are in the `import` folder and I have separated them in the following categories:

1. Core - just things that don't go into any other category.
2. Dates - different manipulations with dates.
3. Directories - manipulations with directories. This one really is a bit unnecessary.
4. Paths - path and string manipulations.

### How to use those scripts

If you like some of these scripts and you would like to use them, depending on your use case, there are different approaches.

#### Bash helper functions

If you want to have some of those functions available in your terminal, you could just copy them and paste them to your `.bash_rc` or whatever the name file.

#### Use them in a script

In case you want to use them in a script, probably the best way would be to get the import folder in your script folder and then have the following few lines in the beginning of your scripts:
	
	RUN_DIR=`dirname $0`
	. $RUN_DIR/import/core.sh
	. $RUN_DIR/import/dates.sh
	. $RUN_DIR/import/paths.sh
	. $RUN_DIR/import/directories.sh

> The above method could also be used in the `.bash_rc` case. You would just need to make sure the paths are adjusted properly and accessible from your `.bash_rc` file.

### Contributions and Feedback

Any feedback is welcome!

If you want to contribute, I will be more than happy to review your pull requests. Any improvements to the scripts are always welcome.