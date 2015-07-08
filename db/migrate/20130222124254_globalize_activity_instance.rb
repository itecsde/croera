class GlobalizeActivityInstance < ActiveRecord::Migration
  def up
    ActivityInstance.create_translation_table! :name => :string, :description => :text
  end

  def down
  end
end
