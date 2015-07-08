class AddExperiences < ActiveRecord::Migration
  def up
    create_table "experiences", :force => true do |t|
      t.integer "guide_id"
    end
  end

  def down
  end
end
