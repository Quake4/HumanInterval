. .\HumanInterval.ps1

$tests = @{
	"30mins1sec1day" = 24*60*60+30*60+1
	"30minutes1secs1days" = 24*60*60+30*60+1
	"2hours 3mins1 secs" = 2*60*60+3*60+1
	"2hours 15 min" = 2*60*60+15*60
	"2hours 2hours 15 min 1 min" = 4*60*60+16*60
	"90 min" = 90*60
}

$tests.Keys | ForEach-Object {
	$interval = $_
	Write-Host "Test: $interval" -ForegroundColor Yellow
	$parsed1 = [HumanInterval]::Parse($interval).TotalSeconds
	if ($parsed1 -eq $tests."$interval") {
		Write-Host "Passed: [HumanInterval]::Parse(`"$interval`").TotalSeconds: $parsed1" -ForegroundColor Green
	}
	else {
		Write-Host "Failed: [HumanInterval]::Parse(`"$interval`").TotalSeconds: $parsed1" -ForegroundColor Red
	}

	$parsed2 = (Get-Interval $interval).TotalSeconds
	if ($parsed2 -eq $tests."$interval") {
		Write-Host "Passed: (Get-Interval `"$interval`").TotalSeconds: $parsed2" -ForegroundColor Green
	}
	else {
		Write-Host "Failed: (Get-Interval `"$interval`").TotalSeconds: $parsed2" -ForegroundColor Red
	}
	Remove-Variable parsed2, parsed1, interval
}