class ModifyApplication < ActiveRecord::Migration
  def up
    add_column :applications, :likes_in_alternative_to, :integer
  end

  def down
  end
end
