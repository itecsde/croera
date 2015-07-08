class AddGroups < ActiveRecord::Migration
  def up
      create_table "groups", :force => true do |t|
        t.string "name"
        t.string "description"
        t.timestamps                
      end
      add_attachment :groups, :element_image
      
    
      create_table "group_person_annotations", :force => true do |t|
        t.integer "group_id"
        t.integer "person_id"
      end
  end

  def down
  end
end
