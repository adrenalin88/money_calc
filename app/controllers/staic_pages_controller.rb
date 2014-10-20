class StaicPagesController < ApplicationController
  def home
  end

  def about
  	@users = User.all
  end
end
