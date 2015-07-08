class ConcreteRequirementToolAnnotation < ActiveRecord::Base
  belongs_to :concrete_requirement
  belongs_to :tool, :polymorphic => true
end