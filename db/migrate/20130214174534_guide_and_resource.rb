class GuideAndResource < ActiveRecord::Migration
  def up
    drop_table "elements"
    
    create_table "guides", :force => true do |t|
    end
    
    create_table "resources", :force => true do |t|
    end
  end

  def down
  end
end
