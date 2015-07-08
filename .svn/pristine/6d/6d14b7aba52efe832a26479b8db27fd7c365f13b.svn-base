class Interaction < ActiveRecord::Base
  translates :name
  
  has_many :activity_interaction_annotations
  has_many :activities, :through => :activity_interaction_annotations
end