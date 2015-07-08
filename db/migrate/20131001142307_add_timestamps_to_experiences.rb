class AddTimestampsToExperiences < ActiveRecord::Migration
  def change
    add_column :experiences, :created_at, :datetime
    add_column :experiences, :updated_at, :datetime
  end
end
