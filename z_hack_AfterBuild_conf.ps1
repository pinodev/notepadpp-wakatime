$SolutionDir = "."

# 1
$HackedFile = "$SolutionDir\WakaTime\WakaTime.csproj"

$UnwantedString = 'C:\Program Files (x86)\Notepad++\plugins\'
$ReplacementString = '$(SolutionDir)\AfterBuild_npp32_plugins\'
(gc $HackedFile -Raw).Replace($UnwantedString, $ReplacementString) | Set-Content -Encoding UTF8 $HackedFile -Force

$UnwantedString = 'C:\Program Files\Notepad++\plugins\'
$ReplacementString = '$(SolutionDir)\AfterBuild_npp64_plugins\'
(gc $HackedFile -Raw).Replace($UnwantedString, $ReplacementString) | Set-Content -Encoding UTF8 $HackedFile -Force

# 2
$HackedFile = "$SolutionDir\WakaTime\PluginInfrastructure\DllExport\NppPlugin.DllExport.targets"

$UnwantedString = '$(MSBuildProgramFiles32)\Notepad++\plugins\'
$ReplacementString = '$(SolutionDir)\AfterBuild_npp32_plugins\'
(gc $HackedFile -Raw).Replace($UnwantedString, $ReplacementString) | Set-Content -Encoding UTF8 $HackedFile -Force

$UnwantedString = '$(ProgramW6432)\Notepad++\plugins\'
$ReplacementString = '$(SolutionDir)\AfterBuild_npp64_plugins\'
(gc $HackedFile -Raw).Replace($UnwantedString, $ReplacementString) | Set-Content -Encoding UTF8 $HackedFile -Force


if ( $args.Count -eq 0 ) { Write-Host "Press any key to continue..."; [void][System.Console]::ReadKey($true) }
