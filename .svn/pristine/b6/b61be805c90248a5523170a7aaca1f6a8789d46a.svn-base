class LearnerMotivation < ActiveRecord::Base
  translates :name
  
  has_many :activity_learner_motivation_annotations
  has_many :activities, :through => :activity_learner_motivation_annotations
end