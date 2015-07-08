class Guide < ActiveRecord::Base
  include Commentable
  include Taggable
  include Ownable
  
  translates :name, :description
  
  searchable do
    I18n.available_locales.each do |locale|
      text "name_" + locale.to_s do
        read_attribute(:name, :locale => locale.to_s)
      end
      text "description_" + locale.to_s do
        read_attribute(:description, :locale => locale.to_s)
      end
    end
    
    integer :owner_id
    time :updated_at
  end
  
  belongs_to :technological_setting, :dependent => :destroy
  belongs_to :contextual_setting, :dependent => :destroy
  belongs_to :activity_sequence, :dependent => :destroy
  
  has_many :experiences
  
  has_many :comments, :as => :commentable, :dependent => :destroy
    
  accepts_nested_attributes_for :technological_setting, :allow_destroy => :true
  accepts_nested_attributes_for :contextual_setting, :allow_destroy => :true
  accepts_nested_attributes_for :activity_sequence, :allow_destroy => :true
  
  attr_accessible :element_image, :name, :description, :technological_setting_attributes, :contextual_setting_attributes, :activity_sequence_attributes
  has_attached_file :element_image, :styles => { :original => "300x300>", :medium => "200x200>", :thumb => "30x30>" }, :default_url => "none"
  
  def clone_with_associations
    new_guide = self.dup
    new_guide.element_image = self.element_image
    
    self.translations.each do |translation|
      new_translation = translation.dup
      new_guide.translations << new_translation
    end
    
    new_technological_setting = self.technological_setting.clone_with_associations
    new_guide.technological_setting = new_technological_setting
    
    new_contextual_setting = self.contextual_setting.clone_with_associations
    new_guide.contextual_setting = new_contextual_setting
    
    new_activity_sequence = self.activity_sequence.clone_with_associations
    new_guide.activity_sequence = new_activity_sequence
    
    new_guide.save
    return new_guide
  end
end