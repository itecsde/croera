class ActivitySequence < ActiveRecord::Base
  include Taggable
  include Ownable
  #include Globalizable
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
    
    text :comments do
      comments.map { |comment| comment.description }
    end
    
    string :status
    integer :owner_id
    time :updated_at
  end
  
  has_many :guides
  has_many :activities, :dependent => :destroy
  
  has_many :comments, :as => :commentable, :dependent => :destroy
  
  accepts_nested_attributes_for :activities, :allow_destroy => :true
  
  attr_accessible :element_image, :name, :description, :activities_attributes, :owner_id, :owner_type
  has_attached_file :element_image, :styles => { :original => "300x300>", :medium => "200x200>", :thumb => "30x30>" }, :default_url => "none"
  
  def clone_with_associations
    new_activity_sequence = self.dup
    new_activity_sequence.element_image = self.element_image
    
    self.activities.each do |activity_instance|
      new_activity_instance = activity_instance.clone_with_associations
      new_activity_sequence.activities << new_activity_instance
    end
    
    self.translations.each do |translation|
      new_translation = translation.dup
      new_activity_sequence.translations << new_translation
    end
    
    new_activity_sequence.save
    return new_activity_sequence
  end
end