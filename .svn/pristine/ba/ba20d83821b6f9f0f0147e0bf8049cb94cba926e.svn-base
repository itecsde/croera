class ModifyLecture < ActiveRecord::Migration
  def up
    add_attachment :lectures, :element_image
    add_column :lectures, :scraped_from, :string
    add_column :lectures, :url, :string
  end

  def down
  end
end
