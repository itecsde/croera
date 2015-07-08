class Level < ActiveRecord::Base
  has_many :requirement_level_annotations
  has_many :requirements, :through => :requirement_level_annotations
end