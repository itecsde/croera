class BookmarkUserElementAnnotation < ActiveRecord::Base
  belongs_to :user
  belongs_to :element, polymorphic: true
  attr_accessible :element_type
end