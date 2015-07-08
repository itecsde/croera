require 'test_helper'

class GuideTest < ActiveSupport::TestCase
  test "resource aggregation" do
    assert_includes(guides(:laws_of_motion_guide).resources, resources(:wikipedia_first_law_of_motion))
    assert_includes(guides(:laws_of_motion_guide).resources, resources(:wikipedia_second_law_of_motion))
    assert_includes(guides(:laws_of_motion_guide).resources, resources(:wikipedia_third_law_of_motion))
    
  end
  
  test "polymorphic activity activitySequence" do
    assert_equal(guides(:laws_of_motion_guide).abstract_activity, activities(:round_robin))
    assert_equal(guides(:laws_of_thermodynamics_guide).abstract_activity, activity_sequences(:think_pair_share))
  end
  
  test "guide globalization" do
    I18n.locale = 'en'
    assert_equal(guides(:laws_of_motion_guide).name, 'Laws of motion guide in English')
    I18n.locale = 'gl'
    assert_equal(guides(:laws_of_motion_guide).name, 'A guia das leis de Newton en galego')
  end
end
