class AddUrl < ActiveRecord::Migration
  def up
    add_column :elements, :url, :string
  end

  def down
  end
end
