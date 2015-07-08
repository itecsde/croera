module Scrapeable  
  def self.included(base)
    base.class_eval do
      after_initialize :build_scraping_status
      has_one :scraping_status, :as => :scrapeable, :dependent => :destroy
      
      def build_scraping_status
        #HACK Este new record no sabemos seguro si debe ir ahi
        if self.new_record?
          sc_status=ScrapingStatus.new
          self.scraping_status=sc_status
        end
      end      
      
    end    
  end
  
end