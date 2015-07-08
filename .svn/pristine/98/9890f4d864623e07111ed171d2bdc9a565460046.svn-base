require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "first law comments" do
    assert_includes(users(:alice).comments, comments(:alice_comment_on_first_law_of_motion_resource))
    assert_includes(resources(:wikipedia_first_law_of_motion).comments, comments(:alice_comment_on_first_law_of_motion_resource))
  end
end