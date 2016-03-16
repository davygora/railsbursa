class PetitionsController < ApplicationController

  COUNT_PET = 10

   before_filter :authorize, only: [:new, :edit, :update, :delete]

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

  def edit
    @petition = Petition.find(params[:id])
  end

  def create
    @petition = current_user.petitions.build(petition_params)

    @petition.save
    redirect_to @petition
  end

  def update
    @petition = Petition.find(params[:id])
    if @petition.user.id != current_user.id
      redirect_to root_path, notice: 'Нету доступа!'
    else 
      if @petition.update(petition_params)
      redirect_to @petition, notice: 'Петиция изменена!'
      else
        render 'edit'
      end
    end
  end

  def destroy
    @petition = Petition.find(params[:id])
    @petition.destroy

    redirect_to petitions_path(:my => 'true'), notice: "Петиция удалена!"
  end

  def vote
    value = params[:type] == "up" ? 1 : -1
    @petition = Petition.find(params[:id])
    @petition.add_or_update_evaluation(:votes, value, current_user)
    redirect_to :back, notice: "Спасибо за голос!"
  end

private
  def petition_params
    params.require(:petition).permit(:title, :text)
  end

end
