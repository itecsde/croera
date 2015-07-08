class Experience < ActiveRecord::Base
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
  
  belongs_to :guide
  
  has_many :experience_steps, :dependent => :destroy
  accepts_nested_attributes_for :experience_steps, :allow_destroy => :true
  
  has_many :comments, :as => :commentable, :dependent => :destroy
  
  attr_accessible :element_image, :name, :description, :experience_steps_attributes, :owner_id, :owner_type
  has_attached_file :element_image, :styles => { :original => "300x300>", :medium => "200x200>", :thumb => "30x30>" }, :default_url => "none"
end