class ProfessionalController < ApplicationController
  before_action :find_prof, only: [:show, :edit, :update, :destroy]

  def new
    @professional = Professional.new
  end

  def create
    @user = current_user
    @professional = @user.build_professional(prof_params)
    if @professional.save
      redirect_to user_professional_path(@user.id, @professional.id)
    else
      redirect_to user_path
    end
  end

  def edit
  end

  def update
    @professional.update_attributes(prof_params)
    if @professional.save
      redirect_to user_professional_path(@user.id, @professional.id)
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @professional.destroy
    redirect_to user_path
  end

  private

  def find_prof
    @user = current_user
    @professional = Professional.find(params[:id])
  end

  def prof_params
    params.require(:professional).permit(:user_id, :category, :specialty, :languages, :address, :phone, :prof_email, :recommended_by)
  end

end
