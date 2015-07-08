class PersonSubjectAnnotation < ActiveRecord::Base
  belongs_to :person
  belongs_to :subject
end