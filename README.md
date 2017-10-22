# Human Interval Converter
Convert human interval to TimeStamp

## Example convert intervals
* "1 hour 30 sec"
* "1 day"
* "45 min"
* "60 seconds"

## Usage
* [TimeStamp] $ts = [HumanInterval]::Parse("30 sec")
* $secs = [HumanInterval]::Parse("5 min 30 sec").TotalSeconds
* $mins = Get-Interval("2 hour 15 min").TotalMinutes

## Requirements
* PowerShell version >= 5.0

## License
[GPL-3.0](https://github.com/Quake4/HumanInterval/blob/master/LICENSE)