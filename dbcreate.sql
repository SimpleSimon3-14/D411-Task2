--check if ClientDB Database exists, if yes delete it and recreate ClientDB
if db_id('ClientDB') is not null
BEGIN
print 'ClientDB Database already exists. Now Deleting ClientDB Database.'
USE master;
ALTER DATABASE ClientDB
SET SINGLE_USER
WiTh ROLLBACK IMMEDIATE;
DROP DATABASE ClientDB;
END;

BEGIN
print 'Now Creating ClientDB Database'
CREATE DATABASE ClientDB;
END
