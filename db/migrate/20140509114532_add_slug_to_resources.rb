class AddSlugToResources < ActiveRecord::Migration
  def change
     add_column :applications, :slug, :string
     add_index :applications, :slug, unique: true
     
     add_column :events, :slug, :string
     add_index :events, :slug, unique: true
     
     add_column :biographies, :slug, :string
     add_index :biographies, :slug, unique: true
     
     add_column :lectures, :slug, :string
     add_index :lectures, :slug, unique: true
     
     add_column :sites, :slug, :string
     add_index :sites, :slug, unique: true
     
     add_column :documentaries, :slug, :string
     add_index :documentaries, :slug, unique: true
     
     add_column :courses, :slug, :string
     add_index :courses, :slug, unique: true
     
     add_column :articles, :slug, :string
     add_index :articles, :slug, unique: true
     
     add_column :posts, :slug, :string
     add_index :posts, :slug, unique: true
     
     add_column :slideshows, :slug, :string
     add_index :slideshows, :slug, unique: true
     
     add_column :reports, :slug, :string
     add_index :reports, :slug, unique: true
     
     add_column :lres, :slug, :string
     add_index :lres, :slug, unique: true
     
     add_column :klascements, :slug, :string
     add_index :klascements, :slug, unique: true
     
     add_column :widgets, :slug, :string
     add_index :widgets, :slug, unique: true
     
     add_column :artworks, :slug, :string
     add_index :artworks, :slug, unique: true
     
  end
end
