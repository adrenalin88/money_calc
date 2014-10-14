require 'rspec'
require 'spec_helper'

describe User do

  before { @user = User.new(name: "Smith", email: "smith@matrix.com", password: "iamtheGod",
                            password_confirmation: "iamtheGod") }
  subject { @user }
  it { should respond_to :name }
  it { should respond_to :email }
  it { should respond_to :password }
  it { should respond_to :password_confirmation }
  it { should respond_to :password_digest }
  it { should be_valid }
end
