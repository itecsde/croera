class ReportSubjectAnnotation < ActiveRecord::Base
  belongs_to :report
  belongs_to :subject
end