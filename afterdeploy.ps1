#Set dns by dhcp server
$ipaddr = ((Test-NetConnection).SourceAddress).IPAddress
$interfaceindex = (get-NetIPAddress -IPAddress $ipaddr).ifIndex
Set-DnsClientServerAddress -InterfaceIndex $interfaceindex -ResetServerAddresses
#disable network card while shutdown
iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/vijaidjearam/deployment/main/disablenetworkcardturnoffwhileshutdown.ps1'))
#install Teams
choco install microsoft-teams.install -y --params "'/AllUsers /NoAutoStart'"
#uninstall project 2019
cscript C:\PROGRA~2\MICROS~3\Office15\ospp.vbs /unpkey:6MWKP
# while using net local group command the french accent 'à' is not getting populated correctly during usage of command to bypass it we use the following command below
# the sid S-1-5-32-555 corresponds to ultilisateur du bureau à distance
$Group = Get-WmiObject -Query "Select * From Win32_Group Where LocalAccount = TRUE And SID = 'S-1-5-32-555'"
$GroupName = $Group.Name
net localgroup $GroupName "985-Student" /ADD
net localgroup $GroupName "985-Faculty" /ADD
net localgroup $GroupName "985-Employee" /ADD
net localgroup "Administrateurs" "985-Student" /ADD
net localgroup "Administrateurs" "985-Faculty" /ADD
net localgroup "Administrateurs" "985-Employee" /ADD
Get-CimInstance -ClassName win32_UserProfile | Where-Object {$_.LocalPath -like "*local-djeara01*"} | Remove-CimInstance
