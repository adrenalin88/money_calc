require 'spec_helper'

describe Transaction do
  
  let(:user) { FactoryGirl.create(:user) }  
  before { user.save }
  before { @transaction = user.transactions.build(amount: 100, comment: "test") }
 
  describe "when no transactions saved" do
  	subject { user }
  	it { should respond_to(:balance) }
  	its(:balance) { should eq 0 }
  end 

  subject { @transaction }

  it { should respond_to(:amount) }
  it { should respond_to(:comment) }
  it { should respond_to(:user_id) }
  it { should be_valid }

  it { should respond_to(:user) }
  its(:user) { should eq user }

  describe "when amount is not present" do
    before { @transaction.amount = nil }
    it { should_not be_valid }
  end

  describe "when transaction saved" do
    before { ballance = user.balance }
    #expect(0).to eq (0) 
  end
  



end
