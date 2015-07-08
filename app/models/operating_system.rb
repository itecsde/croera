class OperatingSystem < ActiveRecord::Base
  belongs_to :circumstance


  has_many :application_operating_system_annotations, :dependent => :destroy
  has_many :applications, :through => :application_operating_system_annotations
end
