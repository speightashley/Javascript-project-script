# Javascript-project-script

## About the project

This project was created because I was fed up of having to type out command after command to get a barebones JS project started.

The script is a bash script that:

- Takes a project name as input from the user
- Creates a remote Github repo for that project
- Sets up a local folder with git started
- Creates bare bones files - index.html, script.js, style.css
- Sets ESlint and Prettier up in the same directory

### Todo

- Support for starting React projects
- Support for Python web projects

## Tools

If tools are not installed on the machine, it will set them up.

The tools it sets up are:

- Git
- GithubCLI
- NodeJS

## Distributions it works on

The script is built to run on Arch based Linux distros

It wouldn't be too difficult to refactor the code to work on Ubuntu or Redhat falvoured distros

If someone wants to add the package manager support for any other distro, just stick a pull request in.

## Usage

There are no flags setup for the script

You just need to start the terminal and change the permissions of the script with chmod

```
$ sudo chmod u+x dev_env.sh
$ ./dev_env.sh
```

```
##################### Welcome to the JS project initialiser #####################

This script will go through the process of starting a project by setting up
the repository, creating a local environment and spinning up ESlint and Prettier

#################### Checking installed software ########################
git version 2.39.2
Git is installed already
gh version 2.23.0 (2023-02-08)
https://github.com/cli/cli/releases/tag/v2.23.0
Github CLI installed

Base software installed

We just need to know two answers before we can start

################# CHOOSE A PROJECT NAME WITHOUT SPACES ####################
Names with spaces in names won't parse properly

What is the name of your project? Javascript-project-script
You chose Javascript-project-script

################# CHOOSE YOUR PROJECT FOLDER #############################
Which local folder do you store all of your projects in?
If you keep them in /home/ashleyspeight/Projects/ for example, just tell me the 'Projects' part of it

The format is just the folder name. Case sensitive: Projects
The /home/ashleyspeight/Projects directory exists
Moving to setup Github and git repos

################ SETTING UP GITHUB REPOS ##################################
Do you want to setup a Github repo now? (Y/N) y
Preparing to setup a Github repo
✓ Created repository speightashley/Javascript-project-script on GitHub
Cloning into 'Javascript-project-script'...
remote: Enumerating objects: 3, done.
remote: Counting objects: 100% (3/3), done.
remote: Total 3 (delta 0), reused 0 (delta 0), pack-reused 0
Receiving objects: 100% (3/3), done.
Github Repo setup

######################## SETTING UP BARE BONES PROJECT ################
Do you want to setup a JS project? (Y/N) n
Skipping file creation

####################### LINTERS AND FORMATTERS SETUP ##################
Do you want to use Prettier and ESlint together with no conflicts? (Y/N) n
Your project is all setup and ready to go

```

It's pretty straightforward but if anyone finds any bugs / dislikes / requests, just let me know :-D
