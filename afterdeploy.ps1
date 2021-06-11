$ipaddr = ((Test-NetConnection).SourceAddress).IPAddress
$interfaceindex = (get-NetIPAddress -IPAddress $ipaddr).ifIndex
Set-DnsClientServerAddress -InterfaceIndex $interfaceindex -ResetServerAddresses
choco install microsoft-teams.install -y --params "'/AllUsers /NoAutoStart'"
$Group = Get-WmiObject -Query "Select * From Win32_Group Where LocalAccount = TRUE And SID = 'S-1-5-32-555'"
$GroupName = $Group.Name
net localgroup $GroupName "985-Student" /ADD
net localgroup $GroupName "985-Faculty" /ADD
net localgroup $GroupName "985-Employee" /ADD
net localgroup "Administrateurs" "985-Student" /ADD
net localgroup "Administrateurs" "985-Faculty" /ADD
net localgroup "Administrateurs" "985-Employee" /ADD
