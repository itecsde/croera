require 'test_helper'

class DashboardTest < ActiveSupport::TestCase
  test "dashboard owners" do
    assert_equal(dashboards(:alice_dashboard).dashboard_owner, users(:alice))
    assert_equal(dashboards(:teleco_dashboard).dashboard_owner, groups(:teleco_teachers))
  end
end
