class Transaction < ActiveRecord::Base
  belongs_to :user
  validates :amount, presence: true

  after_create :inc_ballance
  after_destroy :dec_ballance

  private

  def get_user
  	@user = User.find_by(id: user_id)
  end

  def inc_ballance
  	get_user
  	new_balance = @user.balance + amount
  	@user.update_attribute(:balance, new_balance)
  end

  def dec_ballance
  	get_user
  	new_balance = @user.balance - amount
  	@user.update_attribute(:balance, new_balance)
  end
end
