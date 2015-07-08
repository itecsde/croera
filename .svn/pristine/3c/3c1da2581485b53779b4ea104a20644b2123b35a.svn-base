class Tags < ActiveRecord::Migration
  def up
    create_table "tags", :force => true do |t|
      t.string "name"
    end
    
    create_table "taggable_tag_annotations", :force => true do |t|
      t.integer "taggable_id"
      t.string "taggable_type"
      t.integer "tag_id"
    end
  end

  def down
  end
end
