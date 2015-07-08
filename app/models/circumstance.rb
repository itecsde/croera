class Circumstance < ActiveRecord::Base
  include Taggable
  include Categorizable
  include Scrapeable

  after_save :categorize_it
  belongs_to :user
  #has_one :language
  #has_one :subject
  #has_one :operating_system
  #has_one :education_level
  belongs_to :locale, :class_name => "ContextualLanguage", :foreign_key => "locale_id"
  belongs_to :subject, :class_name => "Subject", :foreign_key => "subject_id"
  belongs_to :educational_level, :class_name => "EducationLevel", :foreign_key => "educational_level_id"
  belongs_to :operating_system, :class_name => "OperatingSystem", :foreign_key => "operating_system_id"
  
=begin  
  def tag_list
    #self.tags.map { |t| t.name if t.taggable_tag_annotations.where(:taggable_id => self.id, :type_tag => nil).size > 0}.join(", ")
    list_tags=""
    self.tags.each do |tag|
        if tag.taggable_tag_annotations.where(:taggable_id => self.id, :type_tag => nil).size > 0
          if list_tags.size > 0
            list_tags+=", "+tag.name
          else
            list_tags+=tag.name
          end
        end
    end
    return list_tags    
  end
 


  def tag_list_quoted
    self.tags.map { |t| '"' + t.name + '"'}.join(", ")
  end  


  def tag_list=(new_value)
    tag_names = new_value.split(/,\s+/)
    #self.tags = tag_names.map { |name| Tag.where('name = ?', name).first or Tag.create(:name => name.strip) }
    self.tags = tag_names.map { |name| Tag.find_by_name(name) or Tag.create(:name => name.strip) }
  end
=end  
  
  def categorize_it
      if self.scraping_status == nil
        self.scraping_status = ScrapingStatus.new
      end
      if self.description != nil && self.description !=""
=begin        
        begin
          translated_description=Translator.translate_bing_detect_language(self.description)
        rescue
          translated_description=self.description
        end
=end    
        #COmo el bing FALLO ahora lo ponemos si traducir
        translated_description=self.description
        tags_ids=self.create_automatic_semantic_annotations(translated_description)
        categorize(tags_ids)
      end
  end
  
end