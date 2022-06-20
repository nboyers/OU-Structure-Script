
# Create Assigment4 OU
$oupath = "ou=Assigment4,dc=nboyers,dc=local"
New-ADOrganizationalUnit -Name Assigment4 -path "dc=nboyers,dc=local"
# Create High-level OUs
New-ADOrganizationalUnit -Name Engineering -path $oupath
New-ADOrganizationalUnit -Name RandD -path $oupath
New-ADOrganizationalUnit -Name IT -path $oupath
New-ADOrganizationalUnit -Name Business -path $oupath
New-ADOrganizationalUnit -Name Legal -path $oupath


# Create Departmental Standard OUS: Users, Groups, Computers, Resources
New-ADOrganizationalUnit -Name Users -path "ou=Engineering,ou=Assigment4,dc=nboyers,dc=local"
New-ADOrganizationalUnit -Name Users -path "ou=RandD,ou=Assigment4,dc=nboyers,dc=local"
New-ADOrganizationalUnit -Name Users -path "ou=Business,ou=Assigment4,dc=nboyers,dc=local"
New-ADOrganizationalUnit -Name Users -path "ou=Legal,ou=Assigment4,dc=nboyers,dc=local"
New-ADOrganizationalUnit -Name Users -path "ou=IT,ou=Assigment4,dc=nboyers,dc=local"

New-ADOrganizationalUnit -Name Groups -path "ou=Engineering,ou=Assigment4,dc=nboyers,dc=local"
New-ADOrganizationalUnit -Name Groups -path "ou=RandD,ou=Assigment4,dc=nboyers,dc=local"
New-ADOrganizationalUnit -Name Groups -path "ou=Business,ou=Assigment4,dc=nboyers,dc=local"
New-ADOrganizationalUnit -Name Groups -path "ou=Legal,ou=Assigment4,dc=nboyers,dc=local"
New-ADOrganizationalUnit -Name Groups -path "ou=IT,ou=Assigment4,dc=nboyers,dc=local"

New-ADOrganizationalUnit -Name Computers -path "ou=Engineering,ou=Assigment4,dc=nboyers,dc=local"
New-ADOrganizationalUnit -Name Computers -path "ou=RandD,ou=Assigment4,dc=nboyers,dc=local"
New-ADOrganizationalUnit -Name Computers -path "ou=Business,ou=Assigment4,dc=nboyers,dc=local"
New-ADOrganizationalUnit -Name Computers -path "ou=Legal,ou=Assigment4,dc=nboyers,dc=local"

New-ADOrganizationalUnit -Name Resources -path "ou=Engineering,ou=Assigment4,dc=nboyers,dc=local"
New-ADOrganizationalUnit -Name Resources -path "ou=RandD,ou=Assigment4,dc=nboyers,dc=local"
New-ADOrganizationalUnit -Name Resources -path "ou=Business,ou=Assigment4,dc=nboyers,dc=local"
New-ADOrganizationalUnit -Name Resources -path "ou=Legal,ou=Assigment4,dc=nboyers,dc=local"



# Create Security Groups
New-ADGroup -Name "IT-HelpDesk" -GroupCategory Security -GroupScope Global -DisplayName "IT HelpDesk" -Path "ou=Groups,ou=IT,ou=Assigment4,dc=nboyers,dc=local"
New-ADGroup -Name "IT-Engineering" -GroupCategory Security -GroupScope Global -DisplayName "IT Engineering" -Path "ou=Groups,ou=IT,ou=Assigment4,dc=nboyers,dc=local"
New-ADGroup -Name "IT-RandD" -GroupCategory Security -GroupScope Global -DisplayName "IT RandD" -Path "ou=Groups,ou=IT,ou=Assigment4,dc=nboyers,dc=local"
New-ADGroup -Name "IT-Business" -GroupCategory Security -GroupScope Global -DisplayName "IT Business" -Path "ou=Groups,ou=IT,ou=Assigment4,dc=nboyers,dc=local"
New-ADGroup -Name "IT-Legal" -GroupCategory Security -GroupScope Global -DisplayName "IT Legal" -Path "ou=Groups,ou=IT,ou=Assigment4,dc=nboyers,dc=local"

# Create users 
New-ADUser -Name betty -AccountPassword (ConvertTo-SecureString "Henry1967?" -AsPlainText -Force) -enabled 1 -path "ou=Users,ou=IT,ou=Assigment4,dc=nboyers,dc=local"

# Add User to Security Group (Example Only for IT-HelpDesk and the built-in Administrators group)
Add-ADGroupMember -Identity "IT-HelpDesk" -Members Joyce
Add-ADGroupMember -Identity "Administrators" -Members Joyce

#Change password for Joyce (Example Only)
Set-ADUserPassword -Identity "Joyce" -Password (ConvertTo-SecureString "Henry1967?" -AsPlainText -Force) 

#Change password through a file(s)
Set-ADUserPassword -Identity "Joyce" -PasswordPath "C:\Users\nboyers\Desktop\password.txt"




