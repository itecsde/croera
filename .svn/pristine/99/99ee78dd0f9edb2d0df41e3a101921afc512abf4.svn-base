class AddSlugAndAuthorToBooks < ActiveRecord::Migration
  def change
     add_column :books, :author, :string
     add_column :books, :slug, :string
     add_index :books, :slug, unique: true     
  end
end
