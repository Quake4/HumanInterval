class HumanInterval {
	static [hashtable] $KnownIntervals = @{
		"sec" = "seconds"
		"secs" = "seconds"
		"second" = "seconds"
		"seconds" = "seconds"
		"min" = "minutes"
		"mins" = "minutes"
		"minute" = "minutes"
		"minutes" = "minutes"
		"hour" = "hours"
		"hours" = "hours"
		"day" = "days"
		"days" = "days"
	}

	static [timespan] Parse([string] $interval) {
		$interval = $interval.ToLower()
		[HumanInterval]::KnownIntervals.Keys | ForEach-Object {
			$interval = $interval.Replace($_, " " + [HumanInterval]::KnownIntervals."$_" + " ")
		}
		[int] $days = 0
		[int] $hours = 0
		[int] $minutes = 0
		[int] $seconds = 0

		[int] $val = 0
		[string] $measure = $null

		$interval.Split(@(' ', ',', ';'), [System.StringSplitOptions]::RemoveEmptyEntries) | ForEach-Object {
			switch ($_) {
				"days" { $days = $val; $val = 0 }
				"hours" { $hours = $val; $val = 0 }
				"minutes" { $minutes = $val; $val = 0 }
				"seconds" { $seconds = $val; $val = 0 }
				default {
					if (![int]::TryParse($_, [ref] $val)) {
						throw [Exception]::new("Unknow interval: $interval")
					}
				}
			}
		}
		if ($days -eq 0 -and $hours -eq 0 -and $minutes -eq 0 -and $seconds -eq 0) {
			throw [Exception]::new("Unknow interval: $interval")
		}
		return New-TimeSpan -Days $days -Hours $hours -Minutes $minutes -Seconds $seconds
	}
}

function Get-Interval ([Parameter(Mandatory)] [string] $interval) {
	[HumanInterval]::Parse($interval)
} 
