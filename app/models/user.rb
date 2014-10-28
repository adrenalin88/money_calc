class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :rememberable, :validatable
  validates :name,  presence: true, length: { maximum: 50 }
  before_save { self.email = email.downcase }
  has_many :transactions
end
