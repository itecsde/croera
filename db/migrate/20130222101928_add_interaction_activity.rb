class AddInteractionActivity < ActiveRecord::Migration
  def up
    add_column :activities, :interaction, :string
    remove_column :activities, :time_to_complete

  end

  def down
  end
end
