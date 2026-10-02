sudo apt-get update 
sudo apt-get install mysql-server
sudo systemctl start mysql
sudo snap install mysql-workbench-community
sudo snap connect mysql-workbench-community:password-manager-service
sudo snap connect mysql-workbench-community:ssh-keys
mysql-workbench-community
mkdir database
cd database
git init
git clone https://github.com/UmuTTu/dblab2026.git
mkdir week2
cd week2
touch Install.sh
nano Install.sh
