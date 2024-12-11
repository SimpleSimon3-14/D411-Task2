/*
.SYNOPSIS
    Imports data into the ClientDB database from a CSV file specified via PowerShell.

.DESCRIPTION
    This script performs the following tasks:
    1. Specifies the ClientDB database for the import.
    2. Prints messages indicating the start of the import process.
    3. Uses the BULK INSERT command to import data from a CSV file into the Client_A_Contacts table. The path to the CSV file is passed from a PowerShell script.

.INPUTS
    None. The script does not take any inputs directly. The path to the CSV file is provided via a PowerShell script.

.OUTPUTS
    Messages indicating the status of the import process.
*/

-- import.sql
print 'now starting import.sql'
USE ClientDB; --this specifies the Database for the import

--Import Data from a CSV using the path from powershell
print 'Beginning Bulk Import of data from' + $(importPath)
BULK INSERT Client_A_Contacts
FROM $(importPath)
WITH(
    FIRSTROW = 2, --this ignores the headers in the csv
    FIELDTERMINATOR =',', --data is delimited (separated) with comma
    ROWTERMINATOR = '\n' --rows are delimited (separated) by newline characters
);