class AbstractRequirementFunctionalityAnnotation < ActiveRecord::Base
  belongs_to :abstract_requirement
  belongs_to :functionality
end