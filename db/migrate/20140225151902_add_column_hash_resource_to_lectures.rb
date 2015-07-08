class AddColumnHashResourceToLectures < ActiveRecord::Migration
  def change
    add_column :lectures, :hash_resource, :string
  end
end
