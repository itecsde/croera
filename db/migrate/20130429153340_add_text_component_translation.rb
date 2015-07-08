class AddTextComponentTranslation < ActiveRecord::Migration
  def up
    Text.create_translation_table! :content => :text
  end

  def down
  end
end
