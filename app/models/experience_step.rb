class ExperienceStep < ActiveRecord::Base
  # A experience_step is a list item in a experience
  belongs_to :experience
  acts_as_list :scope => :experience
  
  # A experience_step may have many contributions of different kinds
  has_many :experience_step_contribution_annotations, :dependent => :destroy
  accepts_nested_attributes_for :experience_step_contribution_annotations, :allow_destroy => :true
end