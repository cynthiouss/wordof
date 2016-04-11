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

  def list
  end

  def myagents
  end


end
