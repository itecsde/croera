class EventRequirement < ActiveRecord::Base
  translates :name, :description
  # Belongs to
  belongs_to :activity
  
  # Has  
  has_one :event_requirement_event_type_annotation, :dependent => :destroy
  accepts_nested_attributes_for :event_requirement_event_type_annotation, :allow_destroy => :true
  has_one :event_type, :through => :event_requirement_event_type_annotation
  
  has_one :event_requirement_event_place_annotation, :dependent => :destroy
  accepts_nested_attributes_for :event_requirement_event_place_annotation, :allow_destroy => :true
  has_one :event_place, :through => :event_requirement_event_place_annotation

  has_one :event_requirement_event_assignment, :dependent => :destroy
  accepts_nested_attributes_for :event_requirement_event_assignment, :allow_destroy => :true
  has_one :event, :through => :event_requirement_event_assignment
  
  def clone_with_associations
    new_event_requirement = self.dup
    new_event_requirement.description = self.description
    new_event_requirement_event_type_annotation = self.event_requirement_event_type_annotation.dup
    new_event_requirement.event_requirement_event_type_annotation = new_event_requirement_event_type_annotation
    new_event_requirement_event_place_annotation = self.event_requirement_event_place_annotation.dup
    new_event_requirement.event_requirement_event_place_annotation = new_event_requirement_event_place_annotation
    new_event_requirement.save
    new_event_requirement
  end
end