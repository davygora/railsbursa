namespace :petitions do
  desc "Chech petitions and send emails to users and admin"
  task check_petition: :environment do
    VotingEndingJob.perform_later
  end
end
