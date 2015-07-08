class Subject < ActiveRecord::Base
  translates :name
  has_many :contextual_setting_subject_annotations

  has_many :event_subject_annotations, :dependent => :destroy
  has_many :events, :through => :event_subject_annotations
  
  has_many :lecture_subject_annotations, :dependent => :destroy
  has_many :lectures, :through => :lecture_subject_annotations
  
end