
#New OU path to add to AD
$newFinanceOU = “ou=Finance,dc=consultingfirm,dc=com”

#Check AD for OU named Finance
#output if OU exists
#If OU Finance Exists Delete OU and Output message that OU was deleted
#Create OU named Finance; output message that OU was created
#Import CSV financePersonnel.csv into AD and directly to Finance OU
  #Required Properties: First Name, Last Name, Display Name (First Name [space] Last Name), postal code, Office Phone, Mobile Phone

#Generate output file: Get-ADUser -Filter * -SearchBase “ou=Finance,dc=consultingfirm,dc=com” -Properties DisplayName,PostalCode,OfficePhone,MobilePhone > .\AdResults.txt
