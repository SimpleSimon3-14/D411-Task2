-- import.sql
print 'now starting import.sql'
USE ClientDB; --this specifies the Database for the import

--Import Data from a CSV using the (path) from powershell
print 'Beginning Bulk Import of data from' + $(PSPATH)
BULK INSERT Client_A_Contacts
FROM $(PSPATH)
WITH(
    FIRSTROW = 2, --this ignores the headers in the csv
    FIELDTERMINATOR =',', --data is delimited (separated) with comma
    ROWTERMINATOR = '\n' --rows are delimited (separated) by newline characters
);