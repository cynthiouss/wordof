class UserController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @user.update_attributes(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @user.destroy
    redirect_to welcome_path
  end

  private

  def find_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:name, :picture, :picture_cache, :city)
  end

end
