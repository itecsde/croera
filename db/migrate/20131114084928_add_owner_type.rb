class AddOwnerType < ActiveRecord::Migration
  def up
    add_column :events, :owner_type, :string
    add_column :people, :owner_type, :string
    add_column :applications, :owner_type, :string
    add_column :devices, :owner_type, :string
    add_column :activity_sequences, :owner_type, :string
  end

  def down
  end
end
