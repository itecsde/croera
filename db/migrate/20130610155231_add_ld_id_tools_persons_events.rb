class AddLdIdToolsPersonsEvents < ActiveRecord::Migration
  def up
    add_column :devices, :ld_id, :string
    add_column :applications, :ld_id, :string
    add_column :people, :ld_id, :string
    add_column :events, :ld_id, :string
  end

  def down
  end
end
