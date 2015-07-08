class FreeText < ActiveRecord::Base
  has_one :experience_step_contribution_annotation, :as => :contribution
  
  has_many :boxes, :dependent => :destroy, :as => :document
  accepts_nested_attributes_for :boxes, :allow_destroy => :true
end