set :enviroment, :development

set :output, "log/cron_log.log"

#every :day, at: "00:01" do
every 1.minutes do
  rake "petitions:check_petition"
end 