# == Schema Information
#
# Table name: activities
#
#  id               :integer          not null, primary key
#  title            :string(255)
#  icon             :string(255)
#  time_to_complete :integer
#  created_at       :datetime
#  updated_at       :datetime
#

require 'test_helper'

class ActivityTest < ActiveSupport::TestCase
  test "the truth" do
    activity1 = Activity.all.last
    puts activity1.icon
    assert true
  end
  
  test "requirement aggregation" do
    assert_equal(activities(:round_robin).requirements.first, requirements(:video_conference_tool))
  end
  
  test "activity globalization" do
    I18n.locale = 'en'
    assert_equal(activities(:round_robin).name, 'Round Robin activity')
    I18n.locale = 'gl'
    assert_equal(activities(:round_robin).name, 'Actividade Round Robin')
  end
  
  test "activity tags" do
    assert_includes(activities(:round_robin).tags, tags(:interesting))
    assert_includes(tags(:interesting).activities, activities(:round_robin))
    assert_includes(activities(:round_robin).tags, tags(:cooperative))
    assert_includes(tags(:cooperative).activities, activities(:round_robin))
  end
end
