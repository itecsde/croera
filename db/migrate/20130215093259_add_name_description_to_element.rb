class AddNameDescriptionToElement < ActiveRecord::Migration
  def change
    add_column :elements, :name, :string
    add_column :elements, :description, :text
  end
end
