class EventType < ActiveRecord::Base
  has_many :event_requirement_event_type_annotations
end