class AddPublicationDateToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :publication_date, :datetime     
  end
end
