# spec/features/user_searchs_spec.rb
require 'spec_helper'

feature 'User searchs' do
    
  scenario 'something without log in', :js => true do
    search_in_the_sde_without_log_in("Nikola Tesla")
    expect(page).to have_content("Buscar")
    expect(page).to have_content("Nikola Tesla")
  end
  
  scenario 'something logged in', :js => true do
    log_in_sde('marcosmourino@gmail.com','1111')
    search_in_the_sde_logged_in("Nikola Tesla")
    expect(page).to have_content("Buscar")
    expect(page).to have_content("Nikola Tesla")
  end  
  
end