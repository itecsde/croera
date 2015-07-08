# spec/support/features/session_helpers.rb
module Features
  module SessionHelpers
    def log_in_sde (email,password)
      url = "http://localhost:3000/"
      visit url
      click_on("Login")
      fill_in 'user_email', :with => email
      fill_in 'user_password', :with => password
      click_button 'login'
    end
     
    def log_out_sde
      page.find("header.z-max div.dropdown div.dropdown_button div.me_and_circumstance").click
      click_on("Cerrar") 
    end
    
    def change_language
      url = "http://localhost:3000/"
      visit url
      page.find("header.z-max div.dropdown.menu_item.dropdown_languages div.dropdown_button div.section_title").click
    end
    
    def search_in_the_sde_without_log_in(text_to_search)
      url = "http://localhost:3000/"
      visit url
      page.fill_in 'search', :with => text_to_search 
      page.all("div.home_search div.home_search_bar_public form input")[2].click
    end
    
    def search_in_the_sde_logged_in(text_to_search)
      url = "http://localhost:3000/"
      visit url
      page.fill_in 'search', :with => text_to_search 
      page.all("div.home_search div.home_search_bar form input")[2].click
    end    
    
    def sign_up_sde (name,surname, email, password, confirm_password)
      url = "http://localhost:3000/"
      visit url
      page.find("div.sign_up div.section_title").click
      fill_in 'user_first_name', :with => name
      fill_in 'user_last_name', :with => surname
      fill_in 'user_email', :with => email 
      fill_in 'user_password', :with => password
      fill_in 'user_password_confirmation', :with => confirm_password
      page.find("div.content_container div.pagewrap div.submit_sign_up input").click
    end
  end
end