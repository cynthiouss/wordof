class ProfessionalController < ApplicationController
  before_action :find_prof, only: [:show, :edit, :update, :destroy]

  def index
    @professionals = Professional.all
  end

  def new
    @professional = Professional.new
  end

  def create
    @professional = Professional.new(prof_params)
    if @professional.save
      redirect_to professional_path(@professional)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @professional.update_attributes(prof_params)
    if @professional.save
      redirect_to professional_path(@professional)
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
    @professional = Professional.find(params[:id])
  end

  def user_params
    params.require(:professional).permit(:category, :specialty, :languages, :address, :phone, :prof_email)
  end

end
