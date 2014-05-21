every 1.minute do
	runner "ScheduleChecker.update_currencies"
end

set :output, 'log/update_currencies.log'