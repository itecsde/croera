class CreateRequirements < ActiveRecord::Migration
  def change
    drop_table :requirements
    create_table :requirements do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
