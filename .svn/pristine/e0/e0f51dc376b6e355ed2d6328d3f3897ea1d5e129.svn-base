class Global < ActiveRecord::Migration
  def up
    Guide.create_translation_table! :name => :string, :description => :text
  end

  def down
    Guide.drop_translation_table!
  end
end
