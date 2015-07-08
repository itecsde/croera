class EventRequirementEventPlaceAnnotation < ActiveRecord::Base
  belongs_to :event_requirement
  belongs_to :event_place
end