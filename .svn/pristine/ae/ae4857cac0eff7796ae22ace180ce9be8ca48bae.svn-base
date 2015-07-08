class ModifyComponent < ActiveRecord::Migration
  def up
    drop_table "components"
    
    create_table "components", :force => true do |t|
      t.integer  "box_id"
      t.string   "component_type"
      t.integer  "position"
      t.string   "area_image_file_name"
      t.string   "area_image_content_type"
      t.integer  "area_image_file_size"
      t.datetime "area_image_updated_at"
    end
  end

  def down
  end
end
