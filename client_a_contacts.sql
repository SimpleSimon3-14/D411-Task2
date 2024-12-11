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