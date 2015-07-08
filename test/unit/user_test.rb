require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "included teachers" do
    assert_includes(Teacher.all, users(:alice))
  end
end
