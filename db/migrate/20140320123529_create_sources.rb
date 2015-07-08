class CreateSources < ActiveRecord::Migration
  def up
    create_table "sources", :force => true do |t|
      t.string "name"
      t.text "source_type"
      t.string "url"
    end
  end

  def down
  end
end
