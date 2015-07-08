class Participant < ActiveRecord::Base
   include Taggable
   #include Ownable
   #include Wikipediable
   #include Globalizable
   #include Aggregable
   #include Categorizable
   #include Scrapeable

   #extend FriendlyId
   #friendly_id :name, use: :slugged

   #translates :name
   #translates :description
   #translates :link
   #translates :raw_html

   searchable do
      integer :id
   end

   # A book may have many comments
   has_many :evaluations
   #has_many :comments, :as => :commentable, :dependent => :destroy

   # A book is categorised into many subjects
   #has_many :book_subject_annotations, :dependent => :destroy
   #has_many :subjects, :through => :book_subject_annotations
   #accepts_nested_attributes_for :book_subject_annotations, :allow_destroy => :true

   # A book is bookmarkable
   #has_many :bookmark_user_element_annotations, :as => :element, :dependent => :destroy
   #has_many :bookmarked_by, :through => :bookmark_user_element_annotations, :source =>:user

   # And a book may include a representative picture
   attr_accessible :element_image, :name, :description, :url, :link, :book_subject_annotations_attributes, :owner_type, :owner_id, :scraped_from, :creator_id, :tag_list, :author, :museum
   has_attached_file :element_image, :styles => { :original => "300x300>", :medium => "200x200>", :thumb => "30x30>" }, :default_url => "none"

   def persist(idiomas_disponibles, prosa, manual_tags)
      if Book.where(:url => self.url).size == 0
         if Book.where(:name => self.name, :author => self.author).size == 0
            self.info_to_wikify = prosa
            self.extract_wikitopics(self.name, prosa, manual_tags)
            #self.categorize(automatic_tags_ids)
            self.save
            self.reload
            Sunspot.index self
            Sunspot.commit
         else
            puts "This book already exists in the library."
         end
      else
         puts "This book already exists in the library."
      end
   end
   
   

   def tag_list=(new_value)
      tag_names = new_value.split(/,\s+/)
      self.tags = tag_names.map { |name| Tag.where('name = ?', name).first or Tag.create(:name => name.strip) }
   end

end