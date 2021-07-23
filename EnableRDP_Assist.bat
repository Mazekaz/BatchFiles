:: Run as Highest Privileges <> Configuration Type - COMPUTER

:: Description  - Enable Remote Desktop & Allow Firewall
::              - Add Localgroup "Remote Desktop Users" for All Users
:: 

@echo off
netsh firewall set service type=remotedesktop mode=enable
netsh advfirewall firewall add rule name="Open Remote Desktop" protocol=TCP dir=in localport=3389 action=allow
netsh advfirewall firewall set rule group="remote desktop" new enable=Yes

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v AllowTSConnections  /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fAllowToGetHelp  /t REG_DWORD /d 1 /f


