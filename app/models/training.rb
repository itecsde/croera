class Training < ActiveRecord::Base
   include Taggable
   include Ownable
   include Wikipediable
   include Globalizable
   include Categorizable
   include Scrapeable

end