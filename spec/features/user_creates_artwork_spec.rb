# spec/features/user_creates_artwork_spec.rb
require 'spec_helper'

feature 'User creates artwork' do
    
  scenario 'correctly', :js => true do
    log_in_sde("marcosmourino@gmail.com", "1111")
    expect(page).to have_content("Marcos")
    visit "http://localhost:3000/es/artworks"
    expect(page).to have_content("Obras de arte")
    page.all("div.secondary_navigation div.actions_menu_items ul.action_list li a img")[1].click
    page.fill_in 'artwork_name', :with => "Artwork test" 
    page.fill_in 'artwork_description', :with => "Description"
    page.fill_in 'artwork_tags', :with => "Golf, Ronaldo"
    page.fill_in 'artwork_author', :with => "Capybara"
    page.fill_in 'artwork_museum', :with => "Capybara museum"
    page.fill_in 'artwork_url', :with => "www.capybara.com"
    page.all("div.secondary_navigation div.actions_menu_items ul.action_list li a.has_tooltip img")[1].click
    expect(page).to have_content("Artwork was successfully created")
  end      
end