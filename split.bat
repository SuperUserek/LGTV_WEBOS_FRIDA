@echo off
set input=%1
set size=10485760
powershell -Command "& {$f=[System.IO.File]::OpenRead('%input%'); $b=New-Object byte[] %size%; $i=1; while($f.Position -lt $f.Length){$r=$f.Read($b,0,%size%); [System.IO.File]::WriteAllBytes('%input%.part'+$i.ToString('000'), $b[0..($r-1)]); Write-Host 'Created: %input%.part'$i.ToString('000'); $i++}; $f.Close()}"