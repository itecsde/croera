class ElementConcrete < ActiveRecord::Migration
  def up
    create_table "elements", :force => true do |t|
      t.string "type"
    end
    
    create_table "proposals", :force => true do |t|
    end
  end

  def down
    drop_table "elements"
    drop_table "proposals"
  end
end
