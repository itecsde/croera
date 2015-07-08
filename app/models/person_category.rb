class PersonCategory < ActiveRecord::Base
  has_many :contributor_requirement_person_category_annotations
end