class EventPlace < ActiveRecord::Base
  has_many :event_requirement_event_place_annotations
end