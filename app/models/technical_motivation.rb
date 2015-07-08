class TechnicalMotivation < ActiveRecord::Base
  translates :name
  
  has_many :activity_technical_motivation_annotations
  has_many :activities, :through => :activity_technical_motivation_annotations
end