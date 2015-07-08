class ContributorRequirement < ActiveRecord::Base
  translates :name, :description
  # Belongs to
  belongs_to :activity
  # Has
  has_one :contributor_requirement_person_category_annotation, :dependent => :destroy
  has_one :person_category, :through => :contributor_requirement_person_category_annotation
  accepts_nested_attributes_for :contributor_requirement_person_category_annotation, :allow_destroy => :true
  
  has_one :contributor_requirement_person_role_annotation, :dependent => :destroy
  has_one :person_role, :through => :contributor_requirement_person_role_annotation
  accepts_nested_attributes_for :contributor_requirement_person_role_annotation, :allow_destroy => :true
 
  has_one :contributor_requirement_person_assignment, :dependent => :destroy
  accepts_nested_attributes_for :contributor_requirement_person_assignment, :allow_destroy => :true
  has_one :person, :through => :contributor_requirement_person_assignment
  
  def clone_with_associations
    new_contributor_requirement = self.dup
    new_contributor_requirement.description = self.description
    new_contributor_requirement_person_category_annotation = self.contributor_requirement_person_category_annotation.dup
    new_contributor_requirement.contributor_requirement_person_category_annotation = new_contributor_requirement_person_category_annotation
    new_contributor_requirement_person_role_annotation = self.contributor_requirement_person_role_annotation.dup
    new_contributor_requirement.contributor_requirement_person_role_annotation = new_contributor_requirement_person_role_annotation
    new_contributor_requirement.save
    new_contributor_requirement
  end
end