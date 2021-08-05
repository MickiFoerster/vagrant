sudo apt update && sudo apt upgrade -y 
sudo apt install mysql-server
sudo mysql_secure_installation
No
->Password
->Password
Yes
Yes
Yes
Yes
sudo systemctl status mysql
->active

sudo -s
mysqladmin create exampledb
mysql
mysql>SHOW databases;
-> shows exampledb
mysql>CREATE USER 'grafana'@'localhost' IDENTIFIED BY 'password';
mysql>GRANT SELECT ON exampledb.* TO 'grafana'@'localhost' ;
mysql>FLUSH PRIVILEGES ;
 
