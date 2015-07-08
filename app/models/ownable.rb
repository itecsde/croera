module Ownable
  def self.included(base)
    base.class_eval do
      belongs_to :owner, polymorphic: true      
      #belongs_to :owner, :foreign_key => "owner_id", :class_name => "User"
      belongs_to :creator, :foreign_key => "creator_id", :class_name => "User"
      attr_accessible :owner_type, :owner_id
    end
  end
end