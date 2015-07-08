class ActivityGlobal < ActiveRecord::Migration
  def up
    drop_table "activity_translations"
    Activity.create_translation_table! :name => :string, :description => :text
  end

  def down
    Activity.drop_translation_table!
  end
end
