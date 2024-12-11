/*
.SYNOPSIS
    Creates the Client_A_Contacts table in the database, checking if it already exists and recreating it if necessary.

.DESCRIPTION
    This script performs the following tasks:
    1. Checks if the Client_A_Contacts table exists.
    2. If the table exists, it prints a message, drops the table, and prints another message.
    3. Creates the Client_A_Contacts table with specified columns.
    4. Prints a message indicating the table has been created.

.INPUTS
    None. The script does not take any inputs.

.OUTPUTS
    Messages indicating the status of the table creation process.
*/



--if client contacts data exists in the Database, drop that table from the database and re-create the table 
DECLARE @Client_A_Contacts VARCHAR(30)
SET @Client_A_Contacts = 'Client_A_Contacts'
IF (EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE
TABLE_NAME = @Client_A_Contacts))
BEGIN
print 'Table' + @Client_A_Contacts + 'already exists. Deleting table and Recreating'
DROP TABLE dbo.Client_A_Contacts
END
BEGIN
CREATE TABLE Client_A_Contacts
(
    first_name varchar(30),
    last_name varchar(30),
    city varchar(30),
    county varchar(30),
    zip varchar(30),
    officePhone varchar(30),
    mobilePhone varchar(30)
)
print 'Table' + @Client_A_Contacts + 'has been created'
END