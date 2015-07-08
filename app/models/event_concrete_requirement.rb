class EventConcreteRequirement < ActiveRecord::Base
  # Belongs to
  belongs_to :activity
  
  # Has
  has_one :event_concrete_requirement_event_annotation, :dependent => :destroy
  accepts_nested_attributes_for :event_concrete_requirement_event_annotation, :allow_destroy => :true 
  has_one :event, :through => :event_concrete_requirement_event_annotation
  
  has_one :event_concrete_requirement_event_assignment, :dependent => :destroy
  accepts_nested_attributes_for :event_concrete_requirement_event_assignment, :allow_destroy => :true
  has_one :event, :through => :event_concrete_requirement_event_assignment
  
  def clone_with_associations
    new_event_concrete_requirement = self.dup
    new_event_concrete_requirement.description = self.description
    new_event_concrete_requirement_event_annotation = self.event_concrete_requirement_event_annotation.dup
    new_event_concrete_requirement.event_concrete_requirement_event_annotation = new_event_concrete_requirement_event_annotation
    new_event_concrete_requirement.save
    new_event_concrete_requirement
  end
end