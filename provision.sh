sudo apt-get update
sudo apt-get remove ruby -y
curl -sSL https://rvm.io/mpapis.asc | sudo gpg --import -
curl -sSL https://get.rvm.io | bash -s stable --ruby=2.3.0
source /etc/profile.d/rvm.sh
sudo apt-get install postgresql postgresql-contrib libpq-dev -y
