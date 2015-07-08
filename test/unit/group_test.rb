require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  test "teacher aggregation" do
    assert_includes(groups(:teleco_teachers).teachers, users(:alice))
  end
end
