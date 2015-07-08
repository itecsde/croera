class CreateActivities < ActiveRecord::Migration
  def change
    drop_table :activities
    create_table :activities do |t|
      t.string :title
      t.text :description
      t.string :icon
      t.text :guidelines
      t.string :time_to_complete

      t.timestamps
    end
  end
end
