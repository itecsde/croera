require "test_helper"

class ApplicationsTest < ActionController::IntegrationTest

  setup do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.start    
    
    User.create(:email => 'admin@example.com', :password => 'password')
  end

  test "1 visit applications page" do
    visit_resources
    click_link "Applications"

    assert_equal current_path, "/" + I18n.locale.to_s + applications_path

  end

  def visit_resources
    visit root_path
    page.find("#flag_en").click
    page.find("#log_in").click
    assert_equal "/" + I18n.locale.to_s + new_user_session_path,  current_path

    fill_in 'user_email', :with => 'admin@example.com'
    fill_in 'user_password', :with => 'password'
    click_button 'Sign in'
    find('#flash_alert').visible?
    
    assert_equal "/"+I18n.locale.to_s + user_root_path, current_path
    click_link "Resources"
  end

end