class AddCreatorToLecture < ActiveRecord::Migration
  def change
    add_column :lectures, :creator_id, :integer
  end
end
