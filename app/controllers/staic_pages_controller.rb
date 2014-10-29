class StaicPagesController < ApplicationController
  
  def home
  	@user = current_user
  	if @user
  		@transactions = @user.transactions.paginate(page: params[:page], per_page: 5).order('created_at DESC')
  	end
  end

  def about
  	@users = User.all
  end
end
