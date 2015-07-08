class EventSubjectAnnotation < ActiveRecord::Base
  belongs_to :event
  belongs_to :subject
end