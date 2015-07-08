class ExperienceStepContributionAnnotation < ActiveRecord::Base
  belongs_to :experience_step
  acts_as_list :scope => :experience_step
  belongs_to :contribution, :polymorphic => true #, :dependent => :destroy
  
  accepts_nested_attributes_for :contribution #, :allow_destroy => :true
  
  # Polymorphic belongs_to
  attr_accessible :name, :description, :position, :contribution_type, :contribution_id, :contribution_attributes
  
  def build_contribution(params, assignment_options)
    self.contribution = contribution_type.constantize.new(params)
  end  
  
end