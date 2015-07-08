class Blog < ActiveRecord::Base
  include Taggable
  include Scrapeable
  has_many :posts, :dependent => :destroy
  # And an post may include a representative picture
  has_attached_file :element_image, :styles => { :original => "300x300>", :medium => "200x200>", :thumb => "30x30>" }, :default_url => "none"
end