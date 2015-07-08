require 'test_helper'

class ExperienceTest < ActiveSupport::TestCase
  test "source guide" do
    assert_equal(experiences(:laws_of_motion_experience1).guide, guides(:laws_of_motion_guide))
    assert_equal(experiences(:laws_of_motion_experience2).guide, guides(:laws_of_motion_guide))
  end
end
