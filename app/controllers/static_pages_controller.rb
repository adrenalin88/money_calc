class StaticPagesController < ApplicationController
  def about
  	@users_count = User.count
  end
end
