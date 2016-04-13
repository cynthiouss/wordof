class SavedsController < ApplicationController
  before_action :set_saved, only: [:destroy]

  def index
    @saveds = current_user.saveds
  end

  def show

  end

  def create
    current_user.saveds.where(professional_id: params[:professional_id]).first_or_create!
    redirect_to user_saveds_path(current_user)
  end

  def destroy
    #current_user.saveds.where(professional_id: params[:professional_id]).destroy
    @saved.destroy
    redirect_to user_saveds_path(current_user)
  end

private

def set_saved
  @saved = Saved.find(params[:id])
end

def saved_param
  params.require(:saved).permit(:user_id, :professional_id)
end

end
