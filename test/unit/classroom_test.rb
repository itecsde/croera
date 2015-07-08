require 'test_helper'

class ClassroomTest < ActiveSupport::TestCase
  test "guide source" do
    assert_equal(guides(:laws_of_motion_guide).classroom, classrooms(:classroom_1course))
  end
  
  test "teachers in classroom" do
    assert_includes(classrooms(:classroom_1course).teachers, users(:alice))
  end
end
