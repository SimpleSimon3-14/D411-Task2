
#New OU path to add to AD
$newFinanceOU = “ou=Finance,dc=consultingfirm,dc=com”

#Check AD for OU named Finance & output if OU exists, delete OU and Output message that OU was deleted
if ([adsi]::Exists("LDAP://$newFinanceOU")) {
  Write-Host -Foreground-Color Red "Finance OU Currently Exists"
  Remove-ADOrganizationalUnit -Identity $newFinanceOU -Recursive -confirm:$false
  Write-Host -Foreground-Color Yellow "Finance OU Deleted"
}

#Create OU named Finance; output message that OU was created
New-ADOrganizationalUnit -Name Finance -ProtectedFromAccidentalDletion $false
Write-Host -ForegroundColor Green "Finance OU ($newFinanceOU) created"
#Import CSV financePersonnel.csv into AD and directly to Finance OU
$FinanceADImport = Import-CSV $PSScriptRoot\financePersonnel.csv
 #Required Properties: First Name, Last Name, Display Name (First Name [space] Last Name), postal code, Office Phone, Mobile Phone
foreach ($FinanceUser in $FinanceADImport)
{
  #$FName = $FinanceUser.First_Name
  #$LName = $FinanceUser.Last_Name
  #$DName = $FName + " " + $LName
  #$SamName = $FinanceUser.samAccount
  #$PostalCode = $FinanceUser.PostalCode
  #$OfficeNum = $FinanceUser.OfficePhone
  #$MobileNum = $FinanceUser.MobilePhone
  
  $Name = $FinanceUser.First_Name + " " + $FinanceUser.Last_Name

#New-AdUser -GivenName $FName -Surname $LName -Name $DName -SamAccountName $SamName -DisplayName $DName -PostalCode $PostalCode -OfficePhone $OfficeNum  -MobilePhone $MobileNum -Path $newFinanceOU
New-AdUser -GivenName $FinanceUser.First_Name -Surname $FinanceUser.Last_Name -Name $Name -SamAccountName $FinanceUser.samAccount -DisplayName $Name -PostalCode $FinanceUser.PostalCode -OfficePhone $FinanceUser.OfficePhone  -MobilePhone $FinanceUser.MobilePhone -Path $newFinanceOU
}

#Generate output file: Get-ADUser -Filter * -SearchBase “ou=Finance,dc=consultingfirm,dc=com” -Properties DisplayName,PostalCode,OfficePhone,MobilePhone > .\AdResults.txt
Get-ADUser -Filter * -SearchBase “ou=Finance,dc=consultingfirm,dc=com” -Properties DisplayName,PostalCode,OfficePhone,MobilePhone > .\AdResults.txt