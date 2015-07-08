class CreatePosts < ActiveRecord::Migration
  def up
     create_table "posts", :force => true do |t|
      t.integer "blog_id"
      t.string "name"
      t.text "description"
      t.string "url"
      t.timestamps
      t.string "hash_resource"     
    end
  end

  def down
  end
end
