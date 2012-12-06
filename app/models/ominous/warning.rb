module Ominous
  class Warning < ActiveRecord::Base
    attr_accessible :name
    
    has_many(
      :warning_closers,
      :uniq => true,
      :order => :position
    )
    
    has_many(
      :closers,
      :through => :warning_closers
    )
  end
end
