class Scenario < ActiveRecord::Base
  include Taggable
  include Ownable
  include Globalizable
  
  Globalize.fallbacks = {:en => [:en, :fi], :fi => [:fi, :en]}
  
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
    boolean :template
    
    string :translations, :multiple => true do
      translations.map{|translation| translation.locale}
    end
  end
  
  
  has_many :boxes, :dependent => :destroy, :as => :document
  has_many :comments, :as => :commentable, :dependent => :destroy

  accepts_nested_attributes_for :boxes, :allow_destroy => :true
  
  attr_accessible :element_image, :name, :description, :boxes_attributes, :owner_id, :owner_type
  has_attached_file :element_image, :styles => { :original => "300x300>", :medium => "200x200>", :thumb => "30x30>" }, :default_url => "none"

end