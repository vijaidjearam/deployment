#Set dns by dhcp server
$ipaddr = ((Test-NetConnection).SourceAddress).IPAddress
$interfaceindex = (get-NetIPAddress -IPAddress $ipaddr).ifIndex
Set-DnsClientServerAddress -InterfaceIndex $interfaceindex -ResetServerAddresses
#disable network card while shutdown
Set-ItemProperty -Path 'HKLM:\System\ControlSet001\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0010' -Name PnPCapabilities -Value 280 -Force
Set-ItemProperty -Path 'HKLM:\System\ControlSet001\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0010' -Name ULPMode -value 0 -Force
#install Teams
choco install microsoft-teams.install -y --params "'/AllUsers /NoAutoStart'"
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
