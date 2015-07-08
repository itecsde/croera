class AddExperienceFields < ActiveRecord::Migration
  def up
    add_column :experiences, :name, :string
    add_column :experiences, :description, :text
    Experience.create_translation_table! :name => :string, :description => :text
  end

  def down
  end
end
