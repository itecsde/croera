class ModifyPerson < ActiveRecord::Migration
  def up
    drop_table "person"
    create_table "people", :force => true do |t|
      t.string "name"
       t.text   "description"
    end
  end

  def down
  end
end
