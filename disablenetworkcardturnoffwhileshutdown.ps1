#disable windows turns off network card while shutdown:
Set-ItemProperty -Path 'HKLM:\System\ControlSet001\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0010' -Name PnPCapabilities -Value 280 -Force
Set-ItemProperty -Path 'HKLM:\System\ControlSet001\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0010' -Name ULPMode -value 0 -Force
