class PagesController < ApplicationController
  def welcome
    @professionals = Professional.all
  end

  def about
  end

  def contact
  end
end
