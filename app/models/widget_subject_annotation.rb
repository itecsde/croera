class WidgetSubjectAnnotation < ActiveRecord::Base
  belongs_to :widget
  belongs_to :subject
end