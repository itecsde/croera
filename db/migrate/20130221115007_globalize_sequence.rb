class GlobalizeSequence < ActiveRecord::Migration
  def up
    ActivitySequence.create_translation_table! :name => :string, :description => :text
  end

  def down
    ActivitySequence.drop_translation_table!
  end
end
