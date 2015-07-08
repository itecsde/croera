class LectureSubjectAnnotation < ActiveRecord::Base
  belongs_to :lecture
  belongs_to :subject
end