class Element < ActiveRecord::Migration
  def up
    create_table "elements", :force => true do |t|
    end
  end

  def down
    drop_table "elements"
  end
end
