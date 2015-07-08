class AddOwnerTypeToExperiences < ActiveRecord::Migration
  def change
     add_column :experiences, :owner_type, :string
  end
end
