class GlobalizeTag < ActiveRecord::Migration
  def up
    Tag.create_translation_table! :name => :string
  end

  def down
    Tag.drop_translation_table!
  end
end
