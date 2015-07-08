# spec/features/user_signs_up_spec.rb
require 'spec_helper'

feature 'User logs in' do
  
  #background do
   # User.create(:email => 'marcosmourino@gmail.com', :password => '1111')
  #end
  
  background do  
    FactoryGirl.define do
      factory :user do
        email "marcosmourino2@gmail.com"
        password  "1111"
      end
    end
    @user = FactoryGirl.create(:user)
    #@user = FactoryGirl.build(:user)
    #@user = Factory(:user, :email => 'marcosmourino@gmail.com', :password => '1111')
  end

 #User.create(:email => "marcosmourino@gmail.com", :password => "1111")

  Steps "Signing in with correct credentials" do
    When "I go to sign in page" do
      visit "/es/users/sign_in/"
    end
    And "I fill in right email" do
      sleep 2
      fill_in "user_email", :with => @user.email
    end
    And "I fill in  right password" do
      sleep 2
      fill_in "user_password", :with => @user.password
    end
    And "I click login" do
      sleep 2
      click_button "login"
      sleep 2
      File.open('text.html', 'w') do |f2|
        f2.puts page.body
      end
    end
    Then "I should see greeting" do
      sleep 1
      expect(page).to have_content("CREAR")
    end
  end


=begin  
  scenario 'with valid email and password', :js => true do
    log_in_sde("marcosmourino@gmail.com","1111")
    expect(page).to have_content("Recommended Reports")
  end
    
  scenario 'with invalid email', :js => true do
    log_in_sde("invalid_email","1111")
    expect(page).to have_content("Login")
  end
   
  scenario 'with incorrect password', :js => true do
    log_in_sde("marcosmourino@gmail.com","")
    expect(page).to have_content("Login")    
  end
=end


    
=begin  
  scenario 'page does not have JavaScript errors', :js => true do
    visit(root_path)
    expect(page).not_to have_errors
  end
   
  
=end
    
=begin    
  scenario 'user switches off enriched mode', :js => true do
    #User.create(:email => 'admin@example.com', :password => 'password')
    visit root_path
    page.find("#flag_en").click
    page.find("#log_in").click
    
    fill_in 'user_email', :with => 'admin@example.com'
    fill_in 'user_password', :with => 'password'
    click_button 'Sign in'
    
    assert_equal current_path, "/" + I18n.locale.to_s + user_root_path  
    
    click_link "Resources"
    click_link "All"
    click_link "Events"
    
    assert_equal "/" + I18n.locale.to_s + events_path, current_path  
    page.should have_content('Enriched On')
    page.should_not have_content('Enriched Off')
    
    click_on "Enriched On"    
    
    page.should have_content('Enriched Off')                     
  end
=end  
  
  
end