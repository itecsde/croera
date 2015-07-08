class ChangeStringToTextCircumstanceDescription < ActiveRecord::Migration
  def up
    remove_column :circumstances, :description
    add_column :circumstances, :description, :text    
  end

  def down
  end
end
