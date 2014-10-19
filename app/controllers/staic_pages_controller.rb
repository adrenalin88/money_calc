class StaicPagesController < ApplicationController
  def home
  end

  def about
  	@users_count = User.count
  end
end
