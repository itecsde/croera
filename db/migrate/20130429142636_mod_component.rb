class ModComponent < ActiveRecord::Migration
  def up
    drop_table "proses"
    create_table "texts", :force => true do |t|
      t.integer "component_id"
      t.text "content"
    end
  end

  def down
  end
end
