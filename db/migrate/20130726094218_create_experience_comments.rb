class CreateExperienceComments < ActiveRecord::Migration
  def up
    create_table "positive_comments", :force => true do |t|
      t.string "name"
      t.text "description"
    end
    
    create_table "negative_comments", :force => true do |t|
      t.string "name"
      t.text "description"
    end
  end

  def down
  end
end
