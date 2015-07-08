class CreateReutersNewItems < ActiveRecord::Migration
  def up
   create_table "reuters_new_items", :force => true do |t|
      t.string "name"
      t.text "description"
      t.string "has_topics"
      t.string "topics"
      t.string "lewissplit"
      t.string "cgisplit"
      t.integer "old_id"
      t.integer "new_id"
      t.string "dateline"
      t.string "places"
      t.string "people"
      t.string "orgs"
      t.string "exchanges"
      t.string "companies"
      t.timestamps
    end     
  end

  def down
  end
end
