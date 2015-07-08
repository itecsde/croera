require "test_helper"

class PeopleTest < ActionController::IntegrationTest

  setup do
    User.create(:email => 'admin@example.com', :password => 'password')
  end

  test "1 visit people page" do
    visit_resources
    
    click_link "People"
    assert_equal current_path, "/"+I18n.locale.to_s+people_path

  end

  def visit_resources
    visit root_path
    page.find("#flag_en").click
    page.find("#log_in").click

    fill_in 'user_email', :with => 'admin@example.com'
    fill_in 'user_password', :with => 'password'
    click_button 'Sign in'

    click_link "Resources"
  end

end