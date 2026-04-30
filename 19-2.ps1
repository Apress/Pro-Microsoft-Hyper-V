$TrialClass = Get-CimClass -ClassName 'Win32_BIOS'
foreach ($Property in $TrialClass.CimClassProperties) {
	Write-Host "$($Property.Name) is a key: " -NoNewline
	$HasKey = $false
	foreach ($Qualifier in $Property.Qualifiers) {
		if ($Qualifier.Name -eq 'Key')
		{
			$HasKey = $true
			break
		}
	}
	Write-Host $HasKey
}