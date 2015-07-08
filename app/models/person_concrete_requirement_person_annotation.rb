class PersonConcreteRequirementPersonAnnotation < ActiveRecord::Base
  belongs_to :person_concrete_requirement
  belongs_to :person
end