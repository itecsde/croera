class Usertype < ActiveRecord::Migration
  def up
    add_column :users, :type, :string
  end

  def down
  end
end
