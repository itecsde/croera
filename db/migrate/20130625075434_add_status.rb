class AddStatus < ActiveRecord::Migration
  def up
    add_column :activities, :status, :string
    add_column :activity_sequences, :status, :string
    add_column :guides, :status, :string
  end

  def down
  end
end
