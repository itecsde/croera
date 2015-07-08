class AddColumnsAuthorAddressMuseumToArtworks < ActiveRecord::Migration
  def change
    add_column :artworks, :author, :string
    add_column :artworks, :museum, :string
    add_column :artworks, :address, :string    
  end
end
