class ModificateUser < ActiveRecord::Migration
  def up
    add_column :users, :image, :binary, :limit => 10.megabyte
    add_column :users, :preferred_language, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string 
  end

  def down
  end
end
