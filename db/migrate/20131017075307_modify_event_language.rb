class ModifyEventLanguage < ActiveRecord::Migration
  def up       
    add_column :events, :contextual_language_id, :integer
  end

  def down
  end
end

