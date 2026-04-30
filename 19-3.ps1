using namespace Microsoft.Management.Infrastructure
$TrialClass = Get-CimClass -ClassName 'Win32_BIOS'
$TrialPropertyName = 'Manufacturer'
$IsKey = $TrialClass.CimClassProperties[$TrialPropertyName].Flags.HasFlag([CimFlags]::Key)
$IsKey
