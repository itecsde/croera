class AddSubject < ActiveRecord::Migration
  def up
    create_table "subjects", :force => true do |t|
      t.string "name"
      t.string "sde_id"
    end
    Subject.create_translation_table! :name => :string
  end

  def down
  end
end
