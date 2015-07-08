class Functionality < ActiveRecord::Base
  translates :name
  
  searchable do
    text :name
    integer :id
  end
  
  has_many :abstract_requirement_functionality_annotations
  has_many :application_functionality_annotations, :dependent => :destroy
  has_many :applications, :through => :application_functionality_annotations
end