class SavedsController < ApplicationController
  def index
    @saveds = current_user.saveds
  end

  def create
    current_user.saveds.where(professional_id: params[:professional_id]).first_or_create!
    redirect_to user_saveds_path(current_user)
  end
end
