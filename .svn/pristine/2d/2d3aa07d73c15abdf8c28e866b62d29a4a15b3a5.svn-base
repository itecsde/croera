class Teacher < User
  has_many :group_teacher_annotations
  has_many :groups, :through => :group_teacher_annotations 
  has_one :dashboard, :as => :dashboard_owner
  
  has_many :classroom_teacher_annotations
  has_many :classrooms, :through => :classroom_teacher_annotations
  
  has_one :profile
end