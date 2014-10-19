require 'spec_helper'

describe "Sessions" do
  subject { page }
  describe "Signup page" do
    before { visit sign_up_path }
    it "should have 'Sign up' words" do
      expect(page).to have_content('Sign up')
    end

    it "should have all fields for registration" do
      expect(page).to have_content('Name')
      expect(page).to have_content('Email')
      expect(page).to have_content('Password')
      expect(page).to have_content('Password confirmation')
      
    end
  end
  describe "Sign in page" do
    before { visit sign_in_path }
    it "should have 'Sign in' words" do
      expect(page).to have_content('Sign in')
    end

    it "should have all fields for sign up" do
      expect(page).to have_content('Email')
      expect(page).to have_content('Password')
      expect(page).not_to have_content('Name')
      expect(page).not_to have_content('Password confirmation')
    end

    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "Email", with: user.email
        fill_in "Password", with: user.password
        click_button 'Sign in'
      end
      it { find_link('Sign out') }
      it { should have_content('Listing users') }
    end
  end
end
