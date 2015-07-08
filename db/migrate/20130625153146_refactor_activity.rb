class RefactorActivity < ActiveRecord::Migration
  def up
    add_column :activities, :position, :integer
    add_column :activities, :activity_sequence_id, :integer
  end

  def down
  end
end
