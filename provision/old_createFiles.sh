#!/bin/bash

#This script is called by bootstrap.sh

#This script creates the file structure necessary to support the django 'super project'
#architecture.  It also creates the python virtual environment where the django project will be created.

#Files/Directories to be created in VirtualEnv inside Vagrant Box for working django instance

#most of the directories created will be under /home/vagrant so it is being given a variable name
LOCAL=/home/vagrant

#cd into the synced folder where you will create the django 'super project'
cd $LOCAL/LibraryEnvironment

#create log file
mkdir logs
touch logs/projects_usep_log.log
sudo chmod 777 /home/vagrant/LibraryEnvironment/logs/projects_usep_log.log

#create local settings folders as python packages
mkdir project_local_settings
touch project_local_settings/__init__.py
mkdir project_local_settings/dj_projects_local_settings
touch project_local_settings/dj_projects_local_settings/__init__.py

#copy in 'super project settings' from shared folder
cp /to_copy/settings_PROJECT.py project_local_settings/dj_projects_local_settings/
cp /to_copy/usep_app_settings.py project_local_settings/dj_projects_local_settings/


#get app from github
#storing it in to_copy for now because there is not yet a 'projects' dir
cd /to_copy/
git clone https://github.com/Brown-University-Library/projects-usep-app.git ./usep_app
