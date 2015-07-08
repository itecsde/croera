require "test_helper"

class EventsTest < ActionController::IntegrationTest

  setup do
    User.create(:email => 'admin@example.com', :password => 'password')
  end

  test "1 visit resources page" do
    visit_resources
    assert_equal current_path, "/"+I18n.locale.to_s+resources_path
  end

  test "2 visit events page" do
    visit_resources
    click_link "Events"

    i=0
    number_of_events = page.all(:xpath, '/html/body/div/div/div[2]/div[@id]')
    number_of_events.each do |item|
      i=i+1
      puts item.text
    end

    puts "Num events: "+number_of_events.to_s+" "+i.to_s+" end"

    assert_equal current_path, "/"+I18n.locale.to_s+events_path

  end

  test "3 enrichment on" do
    visit_resources
    click_link "Events"

    assert_equal page.find('#enriched')['value'] , "1"

  end

  test "4 enrichment off" do
    visit_resources
    click_link "Events"
    
    puts page.find("#enriched")['value']
    
    
    click_button "Enriched On"
    puts page.find("#enriched")['value']
    
    click_button "Enriched Off"
    puts page.find("#enriched_button").text
    
    #expect(page).to have_content('Enriched Off')
    assert_equal page.find('#enriched')['value'] , "0"    

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