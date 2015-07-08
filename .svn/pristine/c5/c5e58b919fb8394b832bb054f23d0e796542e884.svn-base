class Component < ActiveRecord::Base
  belongs_to :box
  has_many :texts, :dependent => :destroy
  
  acts_as_list :scope => :box
  
  attr_accessible :area_image, :component_type, :position, :texts_attributes
  has_attached_file :area_image, :styles => { :original => "300x300>", :medium => "200x200", :thumb => "30x30" }, :default_url => "/images/defaults/:style/picture.jpg"  
  
  accepts_nested_attributes_for :texts, :allow_destroy => :true
  
  def clone_with_associations
    new_component = self.dup
    self.texts.each do |text|
      new_text = text.clone_with_associations
      new_component.texts << new_text
    end
    new_component.save
    new_component
  end
end