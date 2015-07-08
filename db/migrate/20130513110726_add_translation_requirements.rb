class AddTranslationRequirements < ActiveRecord::Migration
  def up
    AbstractRequirement.create_translation_table! :name => :string, :description => :text
    ConcreteRequirement.create_translation_table! :name => :string, :description => :text
    ContributorRequirement.create_translation_table! :name => :string, :description => :text
    EventRequirement.create_translation_table! :name => :string, :description => :text
  end

  def down
  end
end
