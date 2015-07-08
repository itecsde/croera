require 'spec_helper'

feature 'User changes language' do
    
  scenario 'correctly', :js => true do
    change_language
    expect(page).to have_content("Home")
  end
end