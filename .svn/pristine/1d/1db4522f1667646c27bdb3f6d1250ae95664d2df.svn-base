class TeacherMotivation < ActiveRecord::Base
  translates :name
  
  has_many :activity_teacher_motivation_annotations
  has_many :activities, :through => :activity_teacher_motivation_annotations
end