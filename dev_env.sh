#!/usr/bin/env bash

# Dev_env.sh
# Create a dev environment automatically without needing to run multiple commands
#
# Usage - Run the script with executable rights
# To give the script executable rights, from the command line:
# chmod u+x dev_env.sh
#
# First run of script will check:
# 1. Git is installed
# 2. Github CLI is installed
# 3. Nodejs is installed
# 4. If the project directory exists
#
# Setting up a javascript project will:
# Create the local folder for the project
# Create the Git repo on Github
# Add ESlint and Prettier to the project without clashes
#################################################################################

gitversion=$(git --version)
githubcli=$(gh --version)
projectfolder=Projects # Temp hard coded director - Ask the user for it later
projects=$HOME/$projectfolder

echo "##################### Welcome to the JS project initialiser #####################"
echo
echo "This script will go through the process of starting a project by setting up
the repository, creating a local environment and spinning up ESlint and Prettier"

echo
echo
echo

echo "#################### Checking installed software ########################"
sleep 3

# Check installed software
if $gitversion; then
	echo "Git is installed already"
else
	sudo pacman -S git
fi

if $githubcli; then
	echo "Github CLI installed"
else
	echo "Installing Github CLI"
	sleep 2
	sudo pacman -S github-cli
fi

echo

echo "Base software installed"

# if $nodev; then
# 	echo "Node is already installed"
# else
# 	echo "Installing Node"
# 	sleep 2
# 	sudo pacman -S nodejs
# fi
echo
echo "We just need to know two answers before we can start"
echo
sleep 2
printf "################# CHOOSE A PROJECT NAME WITHOUT SPACES ####################"
echo
echo "Names with spaces in names won't parse properly"
echo
read -r -p "What is the name of your project? " projectname
echo "You chose $projectname"
sleep 3
echo
printf "################# CHOOSE YOUR PROJECT FOLDER #############################"
echo
echo "Which local folder do you store all of your projects in? "
echo "If you keep them in $HOME/Projects/ for example, just tell me the 'Projects' part of it"
echo
read -r -p "The format is just the folder name. Case sensitive: " projectfolder

if [ -d "$projects" ]; then
	echo "The $projects directory exists"
	echo "Moving to setup Github and git repos"
	cd "$projects" || exit
	sleep 3
else
	echo "The $projects directory doesn't exist"
	echo "Creating the directory now"
	cd $HOME
	mkdir "$projects -r"
	cd "$projects" || exit
	sleep 3
fi

echo
printf "################ SETTING UP GITHUB REPOS ##################################"
echo
read -r -n1 -p "Do you want to setup a Github repo now? (Y/N) " answer
echo
case $answer in
Y | y)
	echo Preparing to setup a Github repo
	sleep 3
	gh repo create "$projectname" --public --add-readme
	gh repo clone "$projectname"
	cd $projectname || cd $projects/$projectname
	echo "Github Repo setup"
	sleep 2
	;;
N | n)
	echo "Setting up local environment for you"
	mkdir $projectname
	cd $projectname
	echo "Initialising Git"
	sleep 3
	git init
	echo "Local git repo setup"
	sleep 3
	;;
*)
	echo default
	;;
esac

echo
printf "######################## SETTING UP BARE BONES PROJECT ################"
echo
read -r -n1 -p "Do you want to setup a JS project? (Y/N) " js
echo
case $js in
Y | y)
	echo "Creating the starter files"
	sleep 3
	touch index.html style.css script.js
	git add .
	git commit -m "first commit"
	git push
	echo
	echo "Created index.html style.css and script.js"
	sleep 1
	;;
N | n)
	echo "Skipping file creation"
	sleep 2
	;;
esac

echo
printf "####################### LINTERS AND FORMATTERS SETUP ##################"
echo
read -r -n1 -p "Do you want to use Prettier and ESlint together with no conflicts? (Y/N) " lint
echo
case $lint in
Y | y)
	npm init -y
	npm i --save-dev prettier
	npm init @eslint/config
	npm i --save-dev eslint-config-prettier
	;;
N | n)
	echo "Your project is all setup and ready to go"
	;;
esac

code $projectfolder/$projectname/.
