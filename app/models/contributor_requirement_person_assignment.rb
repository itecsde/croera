class ContributorRequirementPersonAssignment < ActiveRecord::Base
  belongs_to :contributor_requirement
  belongs_to :person
end