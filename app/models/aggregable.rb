module Aggregable
  def self.included(base)
    base.class_eval do
      has_many :experience_step_contribution_annotations,  :as => :contribution, :dependent => :destroy
    end
  end
end
