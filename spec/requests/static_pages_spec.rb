require 'spec_helper'

describe "Static pages" do

  describe "About page before authentication" do
  	before { visit about_path }
    it "should have the content 'About MoneyCalc'" do      
      expect(page).to have_content('About MoneyCalc')
    end
    it "should have users counter" do     
      expect(page).to have_content('Users count:')
    end
    it "should have the content 'Sign in'" do      
      expect(page).to have_content('Sign in')
    end
    it "should have the content 'Sign up'" do      
      expect(page).to have_content('Sign up')
    end
    it "should have the content 'Sign out'" do      
      expect(page).not_to have_content('Sign out')
    end
  end

  describe "About page after authentication" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      visit sign_in_path      
      fill_in "Email",    with: user.email.upcase
      fill_in "Password", with: user.password
      click_button "Sign in"
      visit about_path
    end

    it "should have the content 'About MoneyCalc'" do      
      expect(page).to have_content('About MoneyCalc')
    end
    it "should not have users counter" do     
      expect(page).not_to have_content('Users count:')
    end
    it "should not have the content 'Sign in'" do      
      expect(page).not_to have_content('Sign in')
    end
    it "should not have the content 'Sign up'" do      
      expect(page).not_to have_content('Sign up')
    end
    it "should have the content 'Sign out'" do      
      expect(page).to have_content('Sign out')
    end
     it "should have the content 'Listing users'" do      
      expect(page).to have_content('Listing users')
    end
  end
end