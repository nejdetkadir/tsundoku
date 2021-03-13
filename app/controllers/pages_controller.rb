class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:profile]

  def welcome
  end

  def profile
  end
  
end
