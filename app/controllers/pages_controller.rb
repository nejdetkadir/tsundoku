class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:profile]
  before_action :check_signed_in, only: [:welcome]

  def welcome
  end

  def profile
  end
  
end
