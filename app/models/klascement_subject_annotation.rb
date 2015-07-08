class KlascementSubjectAnnotation < ActiveRecord::Base
  belongs_to :klascement
  belongs_to :subject
end