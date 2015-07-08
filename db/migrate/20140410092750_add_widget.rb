class AddWidget < ActiveRecord::Migration
  def up
    create_table "widgets", :force => true do |t|
      t.string "name"
      t.text "description"
      t.timestamps
      t.string "url"
      t.string "scraped_from"
      t.integer "owner_id"
      t.string "owner_type"
      t.integer "creator_id"
      t.string "hash_resource"
      t.text "info_to_wikify"     
    end
    add_attachment :widgets, :element_image
    
    create_table "widget_subject_annotations", :force => true do |t|
      t.integer "widget_id"
      t.integer "subject_id"
      t.float "weight"
    end
    
    Widget.create_translation_table! :name => :string, :description => :text, :link => :string  
  end

  def down
  end
end
