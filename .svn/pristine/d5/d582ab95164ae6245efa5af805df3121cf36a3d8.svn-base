class ContextualSetting < ActiveRecord::Base
  include Taggable
  include Ownable
  
  geocoded_by :address
  # Has
  has_many :comments, :as => :commentable, :dependent => :destroy
  
  has_one :contextual_setting_subject_annotation, :dependent => :destroy
  has_one :subject, :through => :contextual_setting_subject_annotation
  
  has_many :contextual_setting_education_level_annotations, :dependent => :destroy
  has_many :education_levels, :through => :contextual_setting_education_level_annotations
  
  has_many :contextual_setting_language_annotations, :dependent => :destroy
  has_many :contextual_languages, :through => :contextual_setting_language_annotations
  
  accepts_nested_attributes_for :contextual_setting_subject_annotation, :allow_destroy => :true
  accepts_nested_attributes_for :contextual_setting_education_level_annotations, :allow_destroy => :true
  accepts_nested_attributes_for :contextual_setting_language_annotations, :allow_destroy => :true
  
  def clone_with_associations
    new_contextual_setting = self.dup
            
    new_contextual_setting_subject_annotation = self.contextual_setting_subject_annotation.dup
    new_contextual_setting.contextual_setting_subject_annotation = new_contextual_setting_subject_annotation
    
    
    self.contextual_setting_education_level_annotations.each do |contextual_setting_education_level_annotation|
      new_contextual_setting_education_level_annotation = contextual_setting_education_level_annotation.dup
      new_contextual_setting.contextual_setting_education_level_annotations << new_contextual_setting_education_level_annotation
    end
    
    self.contextual_setting_language_annotations.each do |contextual_setting_language_annotation|
      new_contextual_setting_language_annotation = contextual_setting_language_annotation.dup
      new_contextual_setting.contextual_setting_language_annotations << new_contextual_setting_language_annotation
    end
    
    new_contextual_setting.save
    return new_contextual_setting
  end
end
