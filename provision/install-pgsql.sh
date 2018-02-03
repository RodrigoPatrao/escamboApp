#!/usr/bin/env bash

# Installing PostgreSQL
sudo apt-get install postgresql-$1 postgresql-contrib-$1 libpq-dev -y

# ENV_VARS for connecting to DB
echo 'export USERNAME="escamboApp"' >> ~/.bashrc
echo 'export PASSWORD="escamboApp123"' >> ~/.bashrc
