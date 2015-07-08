class Reflexion < ActiveRecord::Base
  has_many :experience_step_contribution_annotations, :as => :contribution
  
  has_many :boxes, :dependent => :destroy, :as => :document
  accepts_nested_attributes_for :boxes, :allow_destroy => :true
end