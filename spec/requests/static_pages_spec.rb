require 'spec_helper'

describe "StaticPages" do
  describe "About page" do
    it "should have text 'about'" do      
      visit '/static_pages/about'
      expect(page).to have_content('About MoneyCalc')     
    end
    it "should have text 'users count'" do      
      visit '/static_pages/about'      
      expect(page).to have_content('Users count:')
    end
  end
end
