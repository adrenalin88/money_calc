require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "pagination" do
    before(:all) { 15.times { FactoryGirl.create(:user) } }
    after(:all)  { User.delete_all }
    let(:user) { FactoryGirl.create(:user) }
	before(:each) do
	  visit sign_in_path      
	  fill_in "Email",    with: user.email.upcase
	  fill_in "Password", with: user.password
	  click_button "Sign in"
      visit users_path
    end
    it { should have_content("Listing users") }
    it { should have_selector('div.pagination') }
    it "should list each user" do
      User.paginate(page: 2).each do |user|
        expect(page).to have_selector('td', text: user.name)
      end
    end
    end
end