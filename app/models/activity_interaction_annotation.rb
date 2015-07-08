class ActivityInteractionAnnotation < ActiveRecord::Base
  belongs_to :activity
  belongs_to :interaction
end