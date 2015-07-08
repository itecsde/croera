module Globalizable
  def self.included(base)
    base.class_eval do
      has_many :globalizable_language_annotations, :as => :globalizable, :dependent => :destroy
      has_many :languages, :through => :globalizable_language_annotations
    end
  end  
end