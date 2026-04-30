New-VMSwitch -Name 'vSwitch' -AllowManagementOS $false `
   -NetAdapterName 'Slot 3 Port 1', 'Slot 5 Port 1' `
	-MinimumBandwidthMode Weight
Add-VMNetworkAdapter -SwitchName 'vSwitch' `
	-Name 'Management' -ManagementOS
Add-VMNetworkAdapter -SwitchName 'vSwitch' `
	-Name 'Cluster'
Set-VMNetworkAdapterVlan -VMNetworkAdapterName 'Management' `
	-Access -VlanId 10
Set-VMNetworkAdapterVlan -VMNetworkAdapterName 'Cluster' `
	-Access -VlanId 20
Set-VMNetworkAdapterTeamMapping -ManagementOS `
	-VMNetworkAdapterName 'Management' `
	-PhysicalNetAdapterName 'Slot 3 Port 1'
Set-VMNetworkAdapterTeamMapping -ManagementOS `
	-VMNetworkAdapterName 'Cluster' `
	-PhysicalNetAdapterName 'Slot 5 Port 1'
New-NetIPAddress -IPAddress 10.5.0.10 -PrefixLength 24 `
	-InterfaceAlias 'vEthernet (Management)' `
	-DefaultGateway 10.5.0.1
New-NetIPAddress -IPAddress 10.5.10.10 -PrefixLength 24 `
	-InterfaceAlias 'vEthernet (Cluster)'
Set-DnsClient -InterfaceAlias 'vEthernet (Cluster)' `
	-RegisterThisConnectionsAddress $false
Set-DnsClientServerAddress -InterfaceAlias 'vEthernet (Management)' `
	-ServerAddresses 10.0.10.1, 10.0.20.1
