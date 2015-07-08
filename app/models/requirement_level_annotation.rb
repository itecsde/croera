class RequirementLevelAnnotation < ActiveRecord::Base
  belongs_to :requirement
  belongs_to :level
end