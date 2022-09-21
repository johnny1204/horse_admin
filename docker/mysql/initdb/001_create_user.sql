CREATE USER 'db_user'@'%' IDENTIFIED BY 'db_password';
GRANT ALL PRIVILEGES ON *.* TO 'db_user'@'%';
FLUSH PRIVILEGES;
