class Course < ActiveRecord::Base
  include Taggable
  include Ownable
  include Wikipediable
  include Globalizable
  include Categorizable
  include Scrapeable
  
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  translates :name
  translates :description
  translates :link
  
  searchable do
    integer :id
    text :name
    text :tags do |p|
      p.tags.map(&:name)
    end
    
    text :w100_wikitopics, :as => :w100_wikitopics do |elem|
       elem.taggable_tag_annotations.map{|annotation| annotation.tag.hashtag if ((annotation.type_tag == "automatic" or annotation.type_tag == "automatic_from_human") && annotation.weight == 1.0)}
    end
    text :w95_wikitopics, :as => :w95_wikitopics do |elem|
       elem.taggable_tag_annotations.map{|annotation| annotation.tag.hashtag if ((annotation.type_tag == "automatic" or annotation.type_tag == "automatic_from_human") && annotation.weight >= 0.95 && annotation.weight < 1.0)}
    end
    text :w90_wikitopics, :as => :w90_wikitopics do |elem|
       elem.taggable_tag_annotations.map{|annotation| annotation.tag.hashtag if ((annotation.type_tag == "automatic" or annotation.type_tag == "automatic_from_human") && annotation.weight >= 0.90 && annotation.weight < 0.95)}
    end
    text :w85_wikitopics, :as => :w85_wikitopics do |elem|
       elem.taggable_tag_annotations.map{|annotation| annotation.tag.hashtag if ((annotation.type_tag == "automatic" or annotation.type_tag == "automatic_from_human") && annotation.weight >= 0.85 && annotation.weight < 0.90)}
    end
    text :w80_wikitopics, :as => :w80_wikitopics do |elem|
       elem.taggable_tag_annotations.map{|annotation| annotation.tag.hashtag if ((annotation.type_tag == "automatic" or annotation.type_tag == "automatic_from_human") && annotation.weight >= 0.80 && annotation.weight < 0.85)}
    end
    text :w75_wikitopics, :as => :w75_wikitopics do |elem|
       elem.taggable_tag_annotations.map{|annotation| annotation.tag.hashtag if ((annotation.type_tag == "automatic" or annotation.type_tag == "automatic_from_human") && annotation.weight >= 0.75 && annotation.weight < 0.80)}
    end
    text :w70_wikitopics, :as => :w70_wikitopics do |elem|
       elem.taggable_tag_annotations.map{|annotation| annotation.tag.hashtag if ((annotation.type_tag == "automatic" or annotation.type_tag == "automatic_from_human") && annotation.weight >= 0.70 && annotation.weight < 0.75)}
    end
    text :w65_wikitopics, :as => :w65_wikitopics do |elem|
       elem.taggable_tag_annotations.map{|annotation| annotation.tag.hashtag if ((annotation.type_tag == "automatic" or annotation.type_tag == "automatic_from_human") && annotation.weight >= 0.65 && annotation.weight < 0.70)}
    end
    text :w60_wikitopics, :as => :w60_wikitopics do |elem|
       elem.taggable_tag_annotations.map{|annotation| annotation.tag.hashtag if ((annotation.type_tag == "automatic" or annotation.type_tag == "automatic_from_human") && annotation.weight >= 0.60 && annotation.weight < 0.65)}
    end
    text :w55_wikitopics, :as => :w55_wikitopics do |elem|
       elem.taggable_tag_annotations.map{|annotation| annotation.tag.hashtag if ((annotation.type_tag == "automatic" or annotation.type_tag == "automatic_from_human") && annotation.weight >= 0.55 && annotation.weight < 0.60)}
    end
    text :w50_wikitopics, :as => :w50_wikitopics do |elem|
       elem.taggable_tag_annotations.map{|annotation| annotation.tag.hashtag if ((annotation.type_tag == "automatic" or annotation.type_tag == "automatic_from_human") && annotation.weight >= 0.50 && annotation.weight < 0.55)}
    end

    text :hashtags_100 do |elem|
       elem.taggable_tag_annotations.map{|annotation| annotation.tag.hashtag if ((annotation.type_tag == "automatic" or annotation.type_tag == "automatic_from_human") && annotation.weight == 1.0)}
    end
    text :hashtags_95 do |elem|
       elem.taggable_tag_annotations.map{|annotation| annotation.tag.hashtag if ((annotation.type_tag == "automatic" or annotation.type_tag == "automatic_from_human") && annotation.weight >= 0.95 && annotation.weight < 1.0)}
    end
    text :hashtags_90 do |elem|
       elem.taggable_tag_annotations.map{|annotation| annotation.tag.hashtag if ((annotation.type_tag == "automatic" or annotation.type_tag == "automatic_from_human") && annotation.weight >= 0.9 && annotation.weight < 0.95)}
    end
    text :hashtags_85 do |elem|
       elem.taggable_tag_annotations.map{|annotation| annotation.tag.hashtag if ((annotation.type_tag == "automatic" or annotation.type_tag == "automatic_from_human") && annotation.weight >= 0.85 && annotation.weight < 0.9)}
    end
    text :hashtags_80 do |elem|
       elem.taggable_tag_annotations.map{|annotation| annotation.tag.hashtag if ((annotation.type_tag == "automatic" or annotation.type_tag == "automatic_from_human") && annotation.weight >= 0.8 && annotation.weight < 0.85)}
    end
    text :hashtags_75 do |elem|
      elem.taggable_tag_annotations.map{|annotation| annotation.tag.hashtag if ((annotation.type_tag == "automatic" or annotation.type_tag == "automatic_from_human") && annotation.weight >= 0.75 && annotation.weight < 0.8)}
    end
    text :hashtags_70 do |elem|
      elem.taggable_tag_annotations.map{|annotation| annotation.tag.hashtag if ((annotation.type_tag == "automatic" or annotation.type_tag == "automatic_from_human") && annotation.weight >= 0.7 && annotation.weight < 0.75)}
    end
    text :hashtags_65 do |elem|
      elem.taggable_tag_annotations.map{|annotation| annotation.tag.hashtag if ((annotation.type_tag == "automatic" or annotation.type_tag == "automatic_from_human") && annotation.weight >= 0.65 && annotation.weight < 0.7)}
    end
    text :hashtags_60 do |elem|
      elem.taggable_tag_annotations.map{|annotation| annotation.tag.hashtag if ((annotation.type_tag == "automatic" or annotation.type_tag == "automatic_from_human") && annotation.weight >= 0.6 && annotation.weight < 0.65)}
    end
    text :hashtags_55 do |elem|
      elem.taggable_tag_annotations.map{|annotation| annotation.tag.hashtag if ((annotation.type_tag == "automatic" or annotation.type_tag == "automatic_from_human") && annotation.weight >= 0.55 && annotation.weight < 0.6)}
    end    
    text :hashtags_50 do |elem|
      elem.taggable_tag_annotations.map{|annotation| annotation.tag.hashtag if ((annotation.type_tag == "automatic" or annotation.type_tag == "automatic_from_human") && annotation.weight < 0.55)}
    end

    
    text :categories do |p|
      p.categories.map(&:name)
    end
    text :subjects do |p|
      p.subjects.map(&:name)
    end 
    text :language do |lan|
      lan.languages.map(&:language)
    end
    string :translations, :multiple => true do
      translations.map{|translation| translation.locale}
    end     
    I18n.available_locales.each do |locale|
      text "description_" + locale.to_s do
        read_attribute(:description, :locale => locale.to_s)
      end
    end    
    integer :owner_id
    time :updated_at
  end
  
  # A course may have many comments
  has_many :comments, :as => :commentable, :dependent => :destroy
  
  # A course is categorised into many subjects
  has_many :course_subject_annotations, :dependent => :destroy
  has_many :subjects, :through => :course_subject_annotations
  accepts_nested_attributes_for :course_subject_annotations, :allow_destroy => :true
  
  # A course is bookmarkable
  has_many :bookmark_user_element_annotations, :as => :element, :dependent => :destroy
  has_many :bookmarked_by, :through => :bookmark_user_element_annotations, :source =>:user

  # And a course may include a representative picture
  attr_accessible :element_image, :name, :description, :url, :link, :course_subject_annotations_attributes, :owner_type, :owner_id, :scraped_from, :creator_id, :tag_list
  has_attached_file :element_image, :styles => { :original => "300x300>", :medium => "200x200>", :thumb => "30x30>" }, :default_url => "none"
   
 
  def persist(idiomas_disponibles, prosa, manual_tags)
    recent_hash = Digest::MD5.hexdigest(prosa)
    check_result = Scraper.check_resource_storage_state(self.class.to_s, self.url,recent_hash)
    if check_result == "insert"
      puts "SE INSERTA EL COURSE"
      self.info_to_wikify = prosa
      self.hash_resource = recent_hash
      self.extract_wikitopics(self.name, prosa, manual_tags)
      #self.categorize(automatic_tags_ids)
      self.save
      self.reload
      Sunspot.index self
      Sunspot.commit      
    elsif check_result == "update"
      puts "UPDATE => SE ACTUALIZA EL COURSE"
      scraped_course = Course.where(:url => self.url)[0]
      idiomas_disponibles.each do |idioma|
        I18n.locale = idioma
        scraped_course.name = self.name
        scraped_course.description = self.description
        scraped_course.link = self.link
      end
      scraped_course.extract_wikitopics(self.name, prosa, manual_tags)
      #scraped_course.categorize(automatic_tags_ids)
      scraped_course.info_to_wikify = prosa
      scraped_course.hash_resource = recent_hash
      scraped_course.save
      scraped_course.reload
      Sunspot.index scraped_course
      Sunspot.commit      
    elsif check_result == "do_nothing"
      puts "DO_NOTHING => NI SE INSERTA NI SE ACTUALIZA EL COURSE, COMPROBAMOS TRADUCCIONES"
      if Course.where(:url => self.url).size != 0
        course = Course.find_by_url(self.url)
        locales_string = Array.new
        course.translated_locales.each do |locale|
          locales_string << locale.to_s
        end
        idiomas_disponibles_string = Array.new
        idiomas_disponibles.each do |idioma_disponible|
          idiomas_disponibles_string << idioma_disponible.to_s          
        end
        if (idiomas_sin_traducciones = idiomas_disponibles_string - locales_string) != []
          puts "ACTUALIZAMOS TRADUCCIONES"
          idiomas_sin_traducciones.each do |idioma|
            I18n.locale = idioma
            puts I18n.locale
            puts self.description
            course.name = self.name
            course.description = self.description
            course.link = self.link
            course.save
          end
        else
          puts "LAS TRADUCCIONES ESTAN COMPLETAS. NO HACEMOS NADA"
        end
      end
    end   
  end

  def tag_list=(new_value)
    tag_names = new_value.split(/,\s+/)
    self.tags = tag_names.map { |name| Tag.where('name = ?', name).first or Tag.create(:name => name.strip) }
  end
  
end