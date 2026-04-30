$VMName = 'vm1'
$DestinationPath = 'C:\VHDs'
$VHDs = @()
foreach ($VMDisk in (Get-VMHardDiskDrive -VMName $VMName))
{
	$SourceFilePath = $VMDisk.Path
	$VHDFileName = Split-Path -Path $SourceFilePath -Leaf
	$DestinationFilePath = Join-Path -Path $DestinationPath -ChildPath $VHDFileName
	$VHDEntry = @{}
	$VHDEntry.Add('SourceFilePath', $SourceFilePath)
	$VHDEntry.Add('DestinationFilePath', $DestinationFilePath)
	$VHDs += $VHDEntry
}

Move-VMStorage -VMName $VMName -Vhds $VHDs
