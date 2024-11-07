create database if not exists syncdaydb;
CREATE USER 'syncday'@'%' IDENTIFIED BY  'syncday';

GRANT ALL PRIVILEGES ON syncdaydb.* TO 'syncday'@'%';

SHOW GRANTS FOR 'syncday'@'%';