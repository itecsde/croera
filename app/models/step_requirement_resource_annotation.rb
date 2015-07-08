class StepRequirementResourceAnnotation < ActiveRecord::Base
  belongs_to :activity_instance
  belongs_to :requirement, :polymorphic => true
  belongs_to :resource, :polymorphic => true
end