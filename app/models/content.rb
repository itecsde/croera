class Content < ActiveRecord::Base
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
  
  belongs_to :subject
  has_many :comments, :as => :commentable, :dependent => :destroy
  
  has_many :content_concrete_requirement_content_annotations
  has_many :content_concrete_requirement_content_assignments
  
  attr_accessible :element_image, :name, :description, :curriculum_topic, :url, :subject_id
  
  has_attached_file :element_image, :styles => { :original => "300x300>", :medium => "200x200>", :thumb => "30x30>" }, :default_url => "none"
end
