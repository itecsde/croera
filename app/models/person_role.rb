class PersonRole < ActiveRecord::Base
  has_many :contributor_requirement_person_role_annotations
end