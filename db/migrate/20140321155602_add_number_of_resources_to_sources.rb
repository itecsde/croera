class AddNumberOfResourcesToSources < ActiveRecord::Migration
  def change
    add_column :sources, :number_of_resources, :integer
  end
end
