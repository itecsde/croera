class Dashboard < ActiveRecord::Base
  belongs_to :dashboard_owner, :polymorphic => true
end