require "test_helper"
 
class LoginSignupTest < ActionController::IntegrationTest
 
setup do
  User.create(:email => 'admin@example.com', :password => 'password')
end
 
test "1 visit login page" do
  visit new_user_session_path
  assert_equal current_path, new_user_session_path
end

test "2 login user" do
  press_flag("#log_in")
  
  fill_in 'user_email', :with => 'admin@example.com'
  fill_in 'user_password', :with => 'password'
  click_button 'Sign in'
  
  assert_equal current_path, "/"+I18n.locale.to_s+user_root_path
end

test "3 invalid login mail" do
  press_flag("#log_in")
   
  fill_in 'user_email', :with => 'admin@example.com'
  fill_in 'user_password', :with => ' '
  click_button 'Sign in'
  find('#flash_alert').visible?
    
  assert_equal current_path, "/"+I18n.locale.to_s+new_user_session_path
end 

test "4 singn up user" do
  press_flag("#sign_up")
    
  fill_in 'user_email', :with => 'new@example.com'
  fill_in 'user_password', :with => 'password'
  fill_in 'user_password_confirmation', :with => 'password'
  click_button 'Sign up'
  
  assert_equal current_path, "/"+I18n.locale.to_s+user_root_path
end 
 
 
test "5 invalid singn_up mail" do
  press_flag("#sign_up")
      
  click_button 'Sign up'
    
  assert_equal current_path, "/"+I18n.locale.to_s+user_registration_path
end  
 
def press_flag(name)
  visit root_path
  page.find("#flag_en").click
  page.find(name).click
end 
 
 
end