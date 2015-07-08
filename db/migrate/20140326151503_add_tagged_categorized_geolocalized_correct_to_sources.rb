class AddTaggedCategorizedGeolocalizedCorrectToSources < ActiveRecord::Migration
  def change
    add_column :sources, :tagged_correct, :boolean 
    add_column :sources, :categorized_correct, :boolean 
    add_column :sources, :geolocalized_correct, :boolean 
  end
end
