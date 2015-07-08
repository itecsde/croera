class AddOwnerToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :owner_id, :integer
    add_column :posts, :owner_type, :string
    add_column :posts, :creator_id, :integer
  end
end
