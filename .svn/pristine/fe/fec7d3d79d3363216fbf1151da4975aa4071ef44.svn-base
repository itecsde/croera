class AbstractRequirement < ActiveRecord::Base
  translates :name, :description
  # Belongs to
  belongs_to :activity
  
  # Has
  has_one :abstract_requirement_functionality_annotation, :dependent => :destroy
  has_one :functionality, :through => :abstract_requirement_functionality_annotation

  has_one :abstract_requirement_tool_assignment, :dependent => :destroy
  has_one :device, :through => :abstract_requirement_tool_assignment, :source => :tool, :source_type => 'Device'
  has_one :application, :through => :abstract_requirement_tool_assignment, :source => :tool, :source_type => 'Application'
  
  accepts_nested_attributes_for :abstract_requirement_functionality_annotation, :allow_destroy => :true
  accepts_nested_attributes_for :abstract_requirement_tool_assignment, :allow_destroy => :true
  
  def clone_with_associations
    new_abstract_requirement = self.dup
    new_abstract_requirement.description = self.description
    new_abstract_requirement_functionality_annotation = self.abstract_requirement_functionality_annotation.dup
    new_abstract_requirement.abstract_requirement_functionality_annotation = new_abstract_requirement_functionality_annotation
    new_abstract_requirement.save
    new_abstract_requirement
  end
end