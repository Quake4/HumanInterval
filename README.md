# Human Interval Time Converter
Convert time human interval to TimeStamp

## Example of time interval conversion
* "1 hour 30 sec"
* "1 day 12 hours 30 minutes"
* "40min 300seconds"
* "60 seconds"

## Known time measurements
* seconds, second, secs, sec
* minutes, minute, mins, min
* hours, hour
* days, day
* weeks, week (since v1.1)

## Include
```powershell
. .\HumanInterval.ps1
```

## Usage
### Example
```powershell
[TimeStamp] $ts = [HumanInterval]::Parse("30 sec")
$secs = [HumanInterval]::Parse("5 min 30 sec").TotalSeconds
$mins = (Get-Interval "2 hour 15 min").TotalMinutes
$mins = (Get-Interval -Interval "1day 6hours 45 mins").TotalMinutes
```

### TimeSpan properties
* Days - Gets the days component of the time interval.
* Hours - Gets the hours component of the time interval.
* Minutes - Gets the minutes component of the time interval.
* Seconds - Gets the seconds component of the time interval.
* TotalDays - Gets the value expressed in whole and fractional days.
* TotalHours - Gets the value expressed in whole and fractional hours.
* TotalMinutes - Gets the value expressed in whole and fractional minutes.
* TotalSeconds - Gets the value expressed in whole and fractional seconds.

## Requirements
PowerShell version >= 5.0

## License
[GPL-3.0](https://github.com/Quake4/HumanInterval/blob/master/LICENSE)
