class Device < ActiveRecord::Base
  include Taggable
  include Ownable
  
  translates :description
  
  searchable do
    text :name
    
    I18n.available_locales.each do |locale|
      text "description_" + locale.to_s do
        read_attribute(:description, :locale => locale.to_s)
      end
    end
    
    integer :owner_id
    time :updated_at
  end
  
  has_many :technological_setting_device_annotations
  has_many :technological_settings, :through => :technological_setting_device_annotations

  has_many :concrete_requirement_tool_annotations, :as => :tool
  has_many :concrete_requirement_tool_assignments, :as => :tool
  has_many :abstract_requirement_tool_assignments, :as => :tool
  
  has_many :comments, :as => :commentable, :dependent => :destroy
  
  attr_accessible :element_image, :name, :description, :url, :itec_id, :ld_id, :external
  has_attached_file :element_image, :styles => { :original => "300x300>", :medium => "200x200>", :thumb => "30x30>" }, :default_url => "none"
end