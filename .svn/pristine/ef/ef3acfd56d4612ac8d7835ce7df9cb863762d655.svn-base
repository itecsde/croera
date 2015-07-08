class TechnologicalSetting < ActiveRecord::Base
 #include Globalizable
  include Taggable
  include Ownable
  
  translates :name
  
  has_many :comments, :as => :commentable, :dependent => :destroy
  
  has_many :technological_setting_device_annotations, :dependent => :destroy
  has_many :devices, :through => :technological_setting_device_annotations
  accepts_nested_attributes_for :technological_setting_device_annotations, :allow_destroy => :true
  
  has_many :technological_setting_application_annotations, :dependent => :destroy
  has_many :applications, :through => :technological_setting_application_annotations
  accepts_nested_attributes_for :technological_setting_application_annotations, :allow_destroy => :true
  
  has_many :guides
  
  def clone_with_associations
    new_technological_setting = self.dup
        
    self.translations.each do |translation|
      new_translation = translation.dup
      new_technological_setting.translations << new_translation
    end
    
    self.technological_setting_application_annotations.each do |application_annotation|
      new_application_annotation = application_annotation.dup
      new_technological_setting.technological_setting_application_annotations << new_application_annotation
    end
    
    self.technological_setting_device_annotations.each do |device_annotation|
      new_device_annotation = device_annotation.dup
      new_technological_setting.technological_setting_device_annotations << new_device_annotation
    end
    
    new_technological_setting.save
    return new_technological_setting
  end
end