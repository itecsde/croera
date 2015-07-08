require 'spec_helper'

feature 'User logs out' do
    
  scenario 'correctly', :js => true do
    log_in_sde("marcosmourino@gmail.com","1111")
    expect(page).to have_content("Marcos")
    log_out_sde
    expect(page).to have_content("Login")
    expect(page).to have_content("Registrarse")
  end
end