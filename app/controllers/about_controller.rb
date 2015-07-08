class AboutController < ApplicationController
   
   def contact
      respond_to do |format|
         format.html # index.html.erb
      end
   end
   
   def about_us
      respond_to do |format|
         format.html # index.html.erb
      end      
   end
   
   def faqs
      
   end
end