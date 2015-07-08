class CreateClassifiers < ActiveRecord::Migration
  def up
   create_table "classifiers", :force => true do |t|
      t.string "name"
      t.text "description"
      t.timestamps
    end          
  end

  def down
  end
end
