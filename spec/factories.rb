FactoryGirl.define do
  factory :user do
    name "Smith"
    email "smith@nowhere.com"
    password "whosyourdaddy"
    password_confirmation "whosyourdaddy"
  end
  
end
