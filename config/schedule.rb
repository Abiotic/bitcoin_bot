every 1.minute do
	runner "ScheduleChecker.update_currencies", environment => "development"
end

set :output, 'log/update_currencies.log'