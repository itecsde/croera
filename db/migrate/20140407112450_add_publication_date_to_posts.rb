class AddPublicationDateToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :publication_date, :datetime    
  end
end
