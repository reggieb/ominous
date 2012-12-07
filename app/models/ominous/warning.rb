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
    
    def self.trigger(name)
      unless exists?(:name => name)
        raise "Attempt to trigger warning failed: #{name} not recognised"
      end
      requests << name.to_sym
    end
    
    def self.requests
      @requests ||= []
    end
    
    def self.clear_requests
      @requests = []
    end
  end
end
