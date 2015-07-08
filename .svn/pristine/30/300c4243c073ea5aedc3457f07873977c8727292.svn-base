class TemplateEditor < ActiveRecord::Migration
  def up
    create_table "component", :force => true do |t|
      t.integer "activity_id"
      t.string "type"
    end
    create_table "prose", :force => true do |t|
      t.integer "component_id"
      t.text "content"
    end
  end

  def down
  end
end
