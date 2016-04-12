class PagesController < ApplicationController

  def welcome
    @users = User.all
    @categories = Category.all
    @specialties = Specialty.all
    @professionals = Professional.all
  end

  def about
  end

  def contact
  end

  def searchtest
  end

  def profile
  end

  def myagents
  end

  def about
  end


end
