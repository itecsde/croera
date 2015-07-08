class PersonLanguageAnnotation < ActiveRecord::Base
  belongs_to :person
  belongs_to :contextual_language
end