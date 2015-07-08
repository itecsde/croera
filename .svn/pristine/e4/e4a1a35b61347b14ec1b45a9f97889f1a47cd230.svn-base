require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'mechanize'

class ApplicationFunctionalityIntegrator
  
  def integrate_functionalities
    begin
       
      application_seeds = Array.new
      
      application_seeds << {:name => "skype", :functionality_id => 1, :level => 5}
      application_seeds << {:name => "asana", :functionality_id => 3, :level => 5}
      application_seeds << {:name => "mediawiki", :functionality_id => 4, :level => 5}
      application_seeds << {:name => "gimp", :functionality_id => 5, :level => 5}
      application_seeds << {:name => "virtualdub", :functionality_id => 5, :level => 5}
      application_seeds << {:name => "dia", :functionality_id => 6, :level => 5}
      application_seeds << {:name => "libreoffice-impress", :functionality_id => 7, :level => 5}
      application_seeds << {:name => "wikipedia", :functionality_id => 8, :level => 5}
      application_seeds << {:name => "google-docs---forms", :functionality_id => 9, :level => 5}
      application_seeds << {:name => "phpBB", :functionality_id => 10, :level => 5}
      application_seeds << {:name => "libreoffice-writer", :functionality_id => 11, :level => 5}
      application_seeds << {:name => "active-worlds", :functionality_id => 12, :level => 5}
      
      application_seeds.each do |seed|
        url="http://alternativeto.net/software/"+seed[:name]+"/"
        puts url
        name = ""
        page = RestClient.post(url, {'__EVENTVALIDATION'=> "/wEdAAdss8FzwRang97JwDGzOz+AH79HOUM01lfKb/Xh9S8qRg4t4uUa1pUMWecy/KcuLfIg8m5Q4Q/V1YcX4c6CMwXz47hmyy6JR7TyGX41IY6NAMkbOGRTkgNrXOIhCZb2EAR25WY06mvyvZ6RikoLLloxglVs6jxo+ZxH29yTeDdatSYGhbc=",
        '__VIEWSTATE' => "/wEPDwUKMTU4OTE4MDQxNGQYFwVMY3RsMDAkY3RsMDAkY3BoMSRjcGhIZWFkZXIkdWNGaWx0ZXJBbmRTb3J0JHVjTGljZW5zZUZpbHRlckJveCRsdkZpbHRlckV4cGFuZA8UKwAOZGRkZGRkZBQrAAFkAgFkZGRmAv////8PZAUmY3RsMDAkY3RsMDAkY3BoMSRjcGhNYWluJGx2RGlzY3Vzc2lvbnMPZ2QFUWN0bDAwJGN0bDAwJGNwaDEkY3BoSGVhZGVyJHVjRmlsdGVyQW5kU29ydCRsdkR5bmFtaWNNZW51JGN0cmwyJGx2RHluYW1pY01lbnVJdGVtcw8UKwAOZGRkZGRkZDwrAAkAAglkZGRmAv////8PZAVmY3RsMDAkY3RsMDAkY3BoMSRjcGhIZWFkZXIkdWNGaWx0ZXJBbmRTb3J0JHVjUGxhdGZvcm1GaWx0ZXJCb3gkbHZGaWx0ZXJFeHBhbmQkY3RybDIkbHZEeW5hbWljTWVudUl0ZW1zDxQrAA5kZGRkZGRkPCsABAACBGRkZGYC/////w9kBTVjdGwwMCRjdGwwMCRjcGgxJGNwaEhlYWRlciR1Y0Rpc3BsYXlTY3JlZW5zJGx2U2NyZWVucw8UKwAOZGRkZGRkZDwrAAgAAghkZGRmAv////8PZAVmY3RsMDAkY3RsMDAkY3BoMSRjcGhIZWFkZXIkdWNGaWx0ZXJBbmRTb3J0JHVjUGxhdGZvcm1GaWx0ZXJCb3gkbHZGaWx0ZXJFeHBhbmQkY3RybDEkbHZEeW5hbWljTWVudUl0ZW1zDxQrAA5kZGRkZGRkPCsACAACCGRkZGYC/////w9kBWJjdGwwMCRjdGwwMCRjcGgxJGNwaEhlYWRlciR1Y0ZpbHRlckFuZFNvcnQkdWNUYWdzRmlsdGVyQm94JGx2RmlsdGVyRXhwYW5kJGN0cmwwJGx2RHluYW1pY01lbnVJdGVtcw8UKwAOZGRkZGRkZBQrAAJkZAICZGRkZgL/////D2QFRWN0bDAwJGN0bDAwJGNwaDEkY3BoTWFpbiR1Y0l0ZW1JbmZvcm1hdGlvbiR1Y0Rpc3BsYXlTY3JlZW5zJGx2U2NyZWVucw9nZAU4Y3RsMDAkY3RsMDAkY3BoMSRjcGhIZWFkZXIkdWNGaWx0ZXJBbmRTb3J0JGx2RHluYW1pY01lbnUPFCsADmRkZGRkZGQUKwADZGRkAgNkZGRmAv////8PZAVRY3RsMDAkY3RsMDAkY3BoMSRjcGhIZWFkZXIkdWNGaWx0ZXJBbmRTb3J0JGx2RHluYW1pY01lbnUkY3RybDEkbHZEeW5hbWljTWVudUl0ZW1zDxQrAA5kZGRkZGRkFCsAAmRkAgJkZGRmAv////8PZAVmY3RsMDAkY3RsMDAkY3BoMSRjcGhIZWFkZXIkdWNGaWx0ZXJBbmRTb3J0JHVjUGxhdGZvcm1GaWx0ZXJCb3gkbHZGaWx0ZXJFeHBhbmQkY3RybDAkbHZEeW5hbWljTWVudUl0ZW1zDxQrAA5kZGRkZGRkPCsABgACBmRkZGYC/////w9kBU1jdGwwMCRjdGwwMCRjcGgxJGNwaEhlYWRlciR1Y0ZpbHRlckFuZFNvcnQkdWNQbGF0Zm9ybUZpbHRlckJveCRsdkZpbHRlckV4cGFuZA8UKwAOZGRkZGRkZDwrAAUAAgVkZGRmAv////8PZAVmY3RsMDAkY3RsMDAkY3BoMSRjcGhIZWFkZXIkdWNGaWx0ZXJBbmRTb3J0JHVjUGxhdGZvcm1GaWx0ZXJCb3gkbHZGaWx0ZXJFeHBhbmQkY3RybDMkbHZEeW5hbWljTWVudUl0ZW1zDxQrAA5kZGRkZGRkFCsAAmRkAgJkZGRmAv////8PZAVmY3RsMDAkY3RsMDAkY3BoMSRjcGhIZWFkZXIkdWNGaWx0ZXJBbmRTb3J0JHVjUGxhdGZvcm1GaWx0ZXJCb3gkbHZGaWx0ZXJFeHBhbmQkY3RybDQkbHZEeW5hbWljTWVudUl0ZW1zDxQrAA5kZGRkZGRkPCsABwACB2RkZGYC/////w9kBWJjdGwwMCRjdGwwMCRjcGgxJGNwaEhlYWRlciR1Y0ZpbHRlckFuZFNvcnQkdWNUYWdzRmlsdGVyQm94JGx2RmlsdGVyRXhwYW5kJGN0cmwxJGx2RHluYW1pY01lbnVJdGVtcw8UKwAOZGRkZGRkZDwrABIAAhJkZGRmAv////8PZAVBY3RsMDAkY3RsMDAkY3BoMSRjcGhNYWluJHVjSXRlbUluZm9ybWF0aW9uJHVjQWN0aXZpdHlGdWxsJGx2VXNlcnMPZ2QFUWN0bDAwJGN0bDAwJGNwaDEkY3BoSGVhZGVyJHVjRmlsdGVyQW5kU29ydCRsdkR5bmFtaWNNZW51JGN0cmwwJGx2RHluYW1pY01lbnVJdGVtcw8UKwAOZGRkZGRkZDwrAAQAAgRkZGRmAv////8PZAViY3RsMDAkY3RsMDAkY3BoMSRjcGhIZWFkZXIkdWNGaWx0ZXJBbmRTb3J0JHVjU29ydEZpbHRlckJveCRsdkZpbHRlckV4cGFuZCRjdHJsMCRsdkR5bmFtaWNNZW51SXRlbXMPFCsADmRkZGRkZGQUKwADZGRkAgNkZGRmAv////8PZAU5Y3RsMDAkY3RsMDAkY3BoMSRjcGhNYWluJHVjSXRlbUluZm9ybWF0aW9uJGx2Q2hhbmdlZEl0ZW1zD2dkBWVjdGwwMCRjdGwwMCRjcGgxJGNwaEhlYWRlciR1Y0ZpbHRlckFuZFNvcnQkdWNMaWNlbnNlRmlsdGVyQm94JGx2RmlsdGVyRXhwYW5kJGN0cmwwJGx2RHluYW1pY01lbnVJdGVtcw8UKwAOZGRkZGRkZBQrAANkZGQCA2RkZGYC/////w9kBUljdGwwMCRjdGwwMCRjcGgxJGNwaEhlYWRlciR1Y0ZpbHRlckFuZFNvcnQkdWNTb3J0RmlsdGVyQm94JGx2RmlsdGVyRXhwYW5kDxQrAA5kZGRkZGRkFCsAAWQCAWRkZGYC/////w9kBT1jdGwwMCRjdGwwMCRjcGgxJGNwaE1haW4kdWNBbHRlcm5hdGl2ZUl0ZW1MaXN0JGx3QWx0ZXJuYXRpdmVzDxQrAA5kZGRkZGRkPCsAGQACGWRkZGYC/////w9kBUljdGwwMCRjdGwwMCRjcGgxJGNwaEhlYWRlciR1Y0ZpbHRlckFuZFNvcnQkdWNUYWdzRmlsdGVyQm94JGx2RmlsdGVyRXhwYW5kDxQrAA5kZGRkZGRkFCsAAmRkAgJkZGRmAv////8PZCnNzRGq1Is9j7dcd/m0oF7TnolA",
        'ctl00$ctl00$cph1$cphMain$ucAlternativeItemList$btnShowAll'=>"Show all applications", 
        'ctl00$ctl00$cph1$cphMain$ucAlternativeItemList$captchaKey'=> "6LdcfssSAAAAAL-ZxlzRuswW_IJERBQoelZpmhXA",
        'ctl00$ctl00$cph1$cphMain$ucAlternativeItemList$BatchEdit$hdnEditedIds' => "",
        'ctl00$ctl00$cph1$cphMain$ucAlternativeItemList$hdnReportedIds' => "",
        'ctl00$ctl00$cph1$cphMain$ucAlternativeItemList$hiddenSort' => ""})
        list_page = Nokogiri::HTML(page)
        list_page.css('li.item-wrapper').each do |alternative|
          alternative_name = alternative.css("div.item-header h3.app-title a").text.strip
          puts name         
          Application.find_each do |application|
            if application.name == alternative_name
              puts "MATCH, procedemos a anotar funcionality"
              if ((ApplicationFunctionalityAnnotation.find_by_application_id(application) == nil) || (ApplicationFunctionalityAnnotation.find_by_functionality_id(seed[:functionality_id]) == nil) || (ApplicationFunctionalityAnnotation.find_by_level(seed[:level]) == nil))
                puts "CREA NUEVA ANNOTATION: " + application.name
                annotation = ApplicationFunctionalityAnnotation.new             
                annotation.application = application             
                annotation.functionality_id = seed[:functionality_id]             
                annotation.level = seed[:level]             
                annotation.save
              end
            end       
          end     
        end
      end
      
    rescue Exception => e
      puts "Failed integrate_funcionalities"
      puts e.message
      puts e.backtrace.inspect
    end
  end

end