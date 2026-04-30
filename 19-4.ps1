using namespace Microsoft.Management.Infrastructure
$TrialClass = Get-CimClass -ClassName 'Win32_BIOS'
$TrialPropertyName = 'Manufacturer'
foreach ($Property in $TrialClass.CimClassProperties) {
	if ($Property.Flags.HasFlag([CimFlags]::Key)) {
		"$($Property.Name) is a key property"
	}
}
