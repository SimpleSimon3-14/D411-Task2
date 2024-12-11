/*
.SYNOPSIS
    Checks if the ClientDB database exists. If it does, deletes and recreates the ClientDB database.

.DESCRIPTION
    This script performs the following tasks:
    1. Checks if the ClientDB database exists.
    2. If the ClientDB database exists, it prints a message, sets the database to single-user mode with immediate rollback, drops the database, and prints another message.
    3. Creates the ClientDB database and prints a message indicating the database has been created.

.INPUTS
    None. The script does not take any inputs.

.OUTPUTS
    Messages indicating the status of the database creation process.
*/


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
