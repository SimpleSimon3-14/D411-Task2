<#
.SYNOPSIS
    Creates and imports records for a database restore on an SQL Server instance.

.DESCRIPTION
    This script performs the following tasks:
    1. Sets the SQL Server instance and database name.
    2. Executes an SQL script to create the database structure.
    3. Executes an SQL script to create the table `Client_A_Contacts` in the specified database.
    4. Imports data from a CSV file into the `Client_A_Contacts` table.
    5. Executes a query to select all records from the `Client_A_Contacts` table and exports the results to a text file.

.INPUTS
    None. The script does not take any pipeline input.

.OUTPUTS
    System.IO.StreamWriter
    Outputs the results of the SQL query to a text file.

.NOTES
    Version: 1.0
    Author: Patrick Crissey
    Student ID: 011252918

#>


# creating and importing records for Database Restore
$SQLServerName = ".\SQLEXPRESS"
$DBName = "ClientDB"
$tableName = 'dbo.client_a_contacts'
Invoke-Sqlcmd -ServerInstance $SQLServerName -InputFile $PSScriptRoot\dbcreate.sql -Verbose
Invoke-Sqlcmd -ServerInstance $SQLServerName -Database $DBName -InputFile $PSScriptRoot\client_a_contacts.sql -Verbose
Invoke-Sqlcmd -ServerInstance $SQLServerName -Database $DBName -InputFile $PSScriptRoot\import.sql -Variable importPath="'$PSScriptRoot\NewClientData.csv'" -Verbose

Invoke-Sqlcmd -Database $DBName -ServerInstance $SQLServerName -Query 'SELECT * FROM dbo.Client_A_Contacts' > $PSScriptRoot\SqlResults.txt