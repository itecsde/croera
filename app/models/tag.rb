class Tag < ActiveRecord::Base
  translates :name
  
  Globalize.fallbacks = {:en => [:en, :fi, :pt, :es], :pt => [:pt, :en, :es, :fi]}
  
  searchable do
    text :name
    integer :id
  end
  
  has_many :taggable_tag_annotations
  has_many :annotations
  has_many :documents,:through => :annotations, :source => :taggable, :source_type => 'Document'
  has_many :activities, :through => :taggable_tag_annotations, :source => :taggable, :source_type => 'Activity'
  has_many :people,:through => :taggable_tag_annotations, :source => :taggable, :source_type => 'Person'  
  has_many :event,:through => :taggable_tag_annotations, :source => :taggable, :source_type => 'Event'
  has_many :application,:through => :taggable_tag_annotations, :source => :taggable, :source_type => 'Application'
  has_many :sites,:through => :taggable_tag_annotations, :source => :taggable, :source_type => 'Site'
  has_many :biographies,:through => :taggable_tag_annotations, :source => :taggable, :source_type => 'Biography'
  has_many :lectures,:through => :taggable_tag_annotations, :source => :taggable, :source_type => 'Lecture'
  has_many :documentaries,:through => :taggable_tag_annotations, :source => :taggable, :source_type => 'Documentary'
  has_many :courses,:through => :taggable_tag_annotations, :source => :taggable, :source_type => 'Course'
  has_many :articles,:through => :taggable_tag_annotations, :source => :taggable, :source_type => 'Article'
  has_many :lres,:through => :taggable_tag_annotations, :source => :taggable, :source_type => 'Lre'
  has_many :posts,:through => :taggable_tag_annotations, :source => :taggable, :source_type => 'Post'
  has_many :slideshows,:through => :taggable_tag_annotations, :source => :taggable, :source_type => 'Slideshow'
  has_many :reports,:through => :taggable_tag_annotations, :source => :taggable, :source_type => 'Report'





  
  has_many :circumstances,:through => :taggable_tag_annotations, :source => :taggable, :source_type => 'Circumstance'
  
    
    
  
  def hashtag
    if self.name != nil && self.name != ""
      return "#"+self.name.strip().gsub(" ","_")
    else 
      return ""
    end    
  end
    
  
end
