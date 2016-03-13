class VotesController < ApplicationController

  def create
    @vote = Vote.new(vote_params)
  end

private
def vote_params
  params.require(:vote).permit(user_ids: [], petition_ids: [])
end

end
