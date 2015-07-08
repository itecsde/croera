class Text < ActiveRecord::Base
  translates :content
  belongs_to :component
  
  acts_as_list :scope => :component
  
  #attr_accessible :content
  
  def clone_with_associations
    new_text = self.dup
    self.translations.each do |translation|
      new_translation = translation.dup
      new_text.translations << new_translation
    end
    new_text.save
    new_text
  end
end