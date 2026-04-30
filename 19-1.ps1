# Ensure that reading undefined variables throws an error
Set-StrictMode -Version Latest
$TrialClass = Get-CimClass -ClassName 'Win32_BIOS'
$TrialPropertyName = 'Manufacturer'
try {
	$IsKey = [bool]$TrialClass.
	CimClassProperties[$TrialPropertyName].Qualifiers['key'].Value
}
catch {
	$IsKey = $false
}
$IsKey