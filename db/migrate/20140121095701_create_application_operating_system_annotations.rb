class CreateApplicationOperatingSystemAnnotations < ActiveRecord::Migration
  def up
    create_table "application_operating_system_annotations", :force => true do |t|
      t.integer "application_id"
      t.integer "operating_system_id"
    end
  end

  def down
  end
end
