class ActivityInstance < ActiveRecord::Base
  #include Globalizable
  
  translates :name, :description
  
  belongs_to :activity
  
  belongs_to :activity_sequence
  acts_as_list :scope => :activity_sequence
  
  has_many :step_requirement_resource_annotations
  
  accepts_nested_attributes_for :step_requirement_resource_annotations, :allow_destroy => :true
  
  def clone_with_associations
    new_activity_instance = self.dup
    
    self.translations.each do |translation|
      new_translation = translation.dup
      new_activity_instance.translations << new_translation
    end
    
    new_activity_instance.save
    return new_activity_instance
  end
  
  def create_annotations
    activity = Activity.find(self.activity_id)
    activity.concrete_requirements.each do |requirement|
      annotation = StepRequirementResourceAnnotation.new
      annotation.activity_instance_id = self.id
      annotation.requirement_id = requirement.id
      annotation.requirement_type = "ConcreteRequirement"
      annotation.resource_type = requirement.concrete_requirement_tool_annotation.tool_type
      annotation.resource_id = requirement.concrete_requirement_tool_annotation.tool_id
      annotation.save
    end
    
    activity.abstract_requirements.each do |requirement|
      annotation = StepRequirementResourceAnnotation.new
      annotation.activity_instance_id = self.id
      annotation.requirement_id = requirement.id
      annotation.requirement_type = "AbstractRequirement"
      annotation.save
    end
    
    activity.person_concrete_requirements.each do |requirement|
      annotation = StepRequirementResourceAnnotation.new
      annotation.activity_instance_id = self.id
      annotation.requirement_id = requirement.id
      annotation.requirement_type = "PersonConcreteRequirement"
      annotation.resource_type = "Person"
      annotation.resource_id = requirement.person_concrete_requirement_person_annotation.person_id
    end
    
    activity.contributor_requirements.each do |requirement|
      annotation = StepRequirementResourceAnnotation.new
      annotation.activity_instance_id = self.id
      annotation.requirement_id = requirement.id
      annotation.requirement_type = "ContributorRequirement"
      annotation.save  
    end
    
    activity.event_concrete_requirements.each do |requirement|
      annotation = StepRequirementResourceAnnotation.new
      annotation.activity_instance_id = self.id
      annotation.requirement_id = requirement.id
      annotation.requirement_type = "EventConcreteRequirement"
      annotation.resource_type = "Event"
      annotation.resource_id = requirement.event_concrete_requirement_event_annotation.event_id  
    end
    
    activity.event_requirements.each do |requirement|
      annotation = StepRequirementResourceAnnotation.new
      annotation.activity_instance_id = self.id
      annotation.requirement_id = requirement.id
      annotation.requirement_type = "EventRequirement"
      annotation.save  
    end
  end
end