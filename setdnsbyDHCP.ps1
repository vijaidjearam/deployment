#Set DNS to automatically get the DNS server from DHCP
$ipaddr = ((Test-NetConnection).SourceAddress).IPAddress
$interfaceindex = (get-NetIPAddress -IPAddress $ipaddr).ifIndex
Set-DnsClientServerAddress -InterfaceIndex $interfaceindex -ResetServerAddresses
