class Comments < ActiveRecord::Migration
  def up
    create_table "comments", :force => true do |t|
      t.string "name"
      t.string "description"
    end
  end

  def down
  end
end
