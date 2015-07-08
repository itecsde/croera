class GuidelineItem < ActiveRecord::Base
  translates :name, :description
  belongs_to :guidelines_preparation, :class_name => 'Activity'
  belongs_to :guidelines_introduction, :class_name => 'Activity'
  belongs_to :guidelines_activity, :class_name => 'Activity'
  belongs_to :guidelines_assessment, :class_name => 'Activity'
end