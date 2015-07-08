class ConcreteRequirement < ActiveRecord::Base
  translates :name, :description
  # Belongs to
  belongs_to :activity
  # Has
  has_one :concrete_requirement_tool_annotation, :dependent => :destroy
  has_one :device, :through => :concrete_requirement_tool_annotation, :source => :tool, :source_type => 'Device'
  has_one :application, :through => :concrete_requirement_tool_annotation, :source => :tool, :source_type => 'Application' 
  
  has_one :concrete_requirement_tool_assignment, :dependent => :destroy
  has_one :device_assigned, :through => :concrete_requirement_tool_assignment, :source => :tool, :source_type => 'Device'
  has_one :application_assigned, :through => :concrete_requirement_tool_assignment, :source => :tool, :source_type => 'Application'
  
  accepts_nested_attributes_for :concrete_requirement_tool_annotation, :allow_destroy => :true
  accepts_nested_attributes_for :concrete_requirement_tool_assignment, :allow_destroy => :true
  
  def clone_with_associations
    new_concrete_requirement = self.dup
    new_concrete_requirement.description = self.description
    if concrete_requirement_tool_annotation != nil
      new_concrete_requirement_tool_annotation = self.concrete_requirement_tool_annotation.dup
      new_concrete_requirement.concrete_requirement_tool_annotation = new_concrete_requirement_tool_annotation
    end
    new_concrete_requirement.save
    new_concrete_requirement
  end
end