class PetitionsController < ApplicationController

  COUNT_PET = 10

  before_filter :authorize, only: [:new, :edit, :update]

  def index
    if params[:my].present? and params[:my].to_s == 'true'
      @petitions = current_user.petitions
    elsif params[:status].present? and params[:status].to_s == 'all'
      @petitions = Petition.all
    else
      @petitions = Petition.last(COUNT_PET)
    end
  end

  def show
    @petition = Petition.find(params[:id])
  end

  def new
  end

  def create
    @petition = current_user.petitions.build(petition_params)

    @petition.save
    redirect_to @petition
  end

  def update
  end

private
  def petition_params
    params.require(:petition).permit(:title, :text)
  end

end
