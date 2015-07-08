class PersonConcreteRequirement < ActiveRecord::Base
  #Belongs to
  belongs_to :activity
  
  # Has
  has_one :person_concrete_requirement_person_annotation, :dependent => :destroy
  accepts_nested_attributes_for :person_concrete_requirement_person_annotation, :allow_destroy => :true
  has_one :person, :through => :person_concrete_requirement_person_annotation
  
  has_one :person_concrete_requirement_person_assignment, :dependent => :destroy
  accepts_nested_attributes_for :person_concrete_requirement_person_assignment, :allow_destroy => :true
  has_one :person, :through => :person_concrete_requirement_person_assignment
  
  def clone_with_associations
    new_person_concrete_requirement = self.dup
    new_person_concrete_requirement.description = self.description
    new_person_concrete_requirement_person_annotation = self.person_concrete_requirement_person_annotation.dup
    new_person_concrete_requirement.person_concrete_requirement_person_annotation = new_person_concrete_requirement_person_annotation
    new_person_concrete_requirement.save
    new_person_concrete_requirement
  end
end