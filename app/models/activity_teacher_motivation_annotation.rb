class ActivityTeacherMotivationAnnotation < ActiveRecord::Base
  belongs_to :activity
  belongs_to :teacher_motivation
end