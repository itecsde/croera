class Dashboard < ActiveRecord::Migration
  def up
    create_table "dashboards", :force => true do |t|
      t.string "name"
      t.integer "dashboard_owner_id"
      t.string "dashboard_owner_type"
    end
  end

  def down
  end
end
