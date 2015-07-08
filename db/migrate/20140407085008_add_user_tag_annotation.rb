class AddUserTagAnnotation < ActiveRecord::Migration
  
  def up    
     create_table "user_tag_annotations", :force => true do |t|
        t.integer "user_id"
        t.integer "tag_id"
        t.float "weight"
        t.string "type_tag"
        t.integer "wikipedia_article_id"        
     end   
  end

  def down
  end
  
end
