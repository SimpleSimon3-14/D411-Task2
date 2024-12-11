# creating and importing records for Database Restore
$SQLServerName = ".\SQLEXPRESS"
$DBName = "ClientDB"
$tableName = 'dbo.client_a_contacts'
Invoke-Sqlcmd -ServerInstance $SQLServerName -InputFile $PSScriptRoot\dbcreate.sql -Verbose
Invoke-Sqlcmd -ServerInstance $SQLServerName -Database $DBName -InputFile $PSScriptRoot\client_a_contacts.sql -Verbose
Invoke-Sqlcmd -ServerInstance $SQLServerName -Database $DBName -InputFile $PSScriptRoot\import.sql -Variable importPath="'$PSScriptRoot\NewClientData.csv'" -Verbose

Invoke-Sqlcmd -Database $DBName -ServerInstance $SQLServerName -Query 'SELECT * FROM dbo.Client_A_Contacts' > $PSScriptRoot\SqlResults.txt