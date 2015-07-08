require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
  test "source teacher" do
    assert_equal(profiles(:alice_profile).teacher, users(:alice))
  end
end
