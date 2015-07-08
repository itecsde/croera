class AddTranslationItecIdFunctionality < ActiveRecord::Migration
  def up
    Functionality.create_translation_table! :name => :string
    add_column :functionalities, :sde_id, :string
  end

  def down
  end
end
