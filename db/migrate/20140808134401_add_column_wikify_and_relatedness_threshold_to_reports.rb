class AddColumnWikifyAndRelatednessThresholdToReports < ActiveRecord::Migration
  def change
      add_column :reports, :wikify_threshold, :float
      add_column :reports, :relatedness_threshold, :float     
  end
end
