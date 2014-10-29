class TransactionsController < ApplicationController
  respond_to :html, :json
  before_action :set_transaction, only: :destroy

  def index
    @user = params[:user_id] ? User.find_by_id(params[:user_id]) : current_user
    if @user
      @transactions = @user.transactions.paginate(page: params[:page], per_page: 5).order('created_at DESC')
    end
  end

  def new
  	@transaction = current_user.transactions.build
  end

  def create
  	@transaction = current_user.transactions.create(transaction_params)
  	redirect_to root_path
  end

  def destroy
  	@transaction.destroy
  	redirect_to root_path
  end

  private

  def transaction_params
  	params.require(:transaction).permit(:amount, :comment, :user_id)
  end

  def set_transaction
  	@transaction = Transaction.find_by_id(params[:id])
  end

end
