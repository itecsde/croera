class ContentConcreteRequirement < ActiveRecord::Base
  #Belongs to
  belongs_to :activity
  
  # Has
  has_one :content_concrete_requirement_content_annotation, :dependent => :destroy
  accepts_nested_attributes_for :content_concrete_requirement_content_annotation, :allow_destroy => :true
  has_one :content, :through => :content_concrete_requirement_content_annotation
  
  has_one :content_concrete_requirement_content_assignment, :dependent => :destroy
  accepts_nested_attributes_for :content_concrete_requirement_content_assignment, :allow_destroy => :true
  has_one :content, :through => :content_concrete_requirement_content_assignment
  
  def clone_with_associations
    new_content_concrete_requirement = self.dup
    new_content_concrete_requirement.description = self.description
    new_content_concrete_requirement_content_annotation = self.content_concrete_requirement_content_annotation.dup
    new_content_concrete_requirement.content_concrete_requirement_content_annotation = new_content_concrete_requirement_content_annotation
    new_content_concrete_requirement.save
    new_content_concrete_requirement
  end
end