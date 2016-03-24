class VotingEndingJob < ActiveJob::Base
  MAX_COUNT_VOTES = 100

  queue_as :default

  def perform(*args)
    p '===== starting job'
    Petition.published.each do |petition|
      @votes = petition.reputation_for(:votes) #get votes from our petition (gem reputation-system)
      if @votes < MAX_COUNT_VOTES
        PetitionMailer.petition_rejected(petition)
      else
        PetitionMailer.petition_accepted(petition)
        PetitionMailer.email_to_admin(petition)
      end
  end
    p '===== end job'
  end
end
