class DeleteHashToApplication < ActiveRecord::Migration
  def up
    remove_column :applications, :hash
  end

  def down
  end
end
