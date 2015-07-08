class Box < ActiveRecord::Base
  belongs_to :document, :polymorphic => true
  has_many :components
  
  acts_as_list :scope => :document
  accepts_nested_attributes_for :components, :allow_destroy => :true
  
  def clone_with_associations
    new_box = self.dup
    self.components.each do |component|
      new_component = component.clone_with_associations
      new_box.components << new_component
    end
    new_box.save
    new_box
  end
end
