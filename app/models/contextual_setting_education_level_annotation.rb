class ContextualSettingEducationLevelAnnotation < ActiveRecord::Base
  belongs_to :contextual_setting
  belongs_to :education_level
end