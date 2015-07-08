class ContributorRequirementPersonRoleAnnotation < ActiveRecord::Base
  belongs_to :contributor_requirement
  belongs_to :person_role
end