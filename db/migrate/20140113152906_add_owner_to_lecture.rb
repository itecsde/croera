class AddOwnerToLecture < ActiveRecord::Migration
  def change
    add_column :lectures, :owner_id, :integer
    add_column :lectures, :owner_type, :string
  end
end
