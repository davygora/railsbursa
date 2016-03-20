set :output, "log/cron_log.log"

every 1.days.beginning_of_day do 
  rake "petitions:check_petition"
end