class Classroom < ActiveRecord::Base
  has_many :guides
  
  has_many :classroom_teacher_annotations
  has_many :teachers, :through => :classroom_teacher_annotations
  
end