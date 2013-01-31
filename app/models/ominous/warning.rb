module Ominous
  class Warning < ActiveRecord::Base
    attr_accessible :name, :closers_attributes, :title, :description
    
    validates :name, :presence => true
    
    has_many(
      :warning_closers,
      :uniq => true,
      :order => :position
    )
    
    has_many(
      :closers,
      :through => :warning_closers,
      :uniq => true,
      :order => :position
    )
    
    accepts_nested_attributes_for :closers
    
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
    
    # Called after each controller action.
    def self.after_action_tasks
      clear_requests # So that warnings called while processing one action are not carried over to the next where they may not be relevant
    end
    
    private
    def method_missing(symbol, *args, &block)
      if acts_as_list_method?(symbol)
        pass_method_to_warning_closer(symbol, args.first)
      else
        super
      end
    end

  #  Allows acts_as_list methods to be used within the warning. 
  #  If closers were the act_as_list object, you could do things like this
  #   
  #       warning.closers.last.move_higher
  #       
  #   However, as closers are used on multiple warnings and they
  #   need to be independently sortable within each warning, it is the
  #   through table model WarningCloser that acts_as_list. To change
  #   position the change must be made in the context of the warning. 
  #   pass_method_to_warning_closer in combination with method_missing,
  #   allows you to pass to a warning the acts_as_list method together with
  #   the closer it needs to effect. The equivalent move_higher call then becomes:
  #   
  #       warning.move_higher(warning.closers.last)
  #       
  #   You can also do:
  #   
  #       warning.move_to_top(closer)
  #       warning.last?(closer)
  # 
    def pass_method_to_warning_closer(symbol, closer)
      raise "A closer is needed to identify the warning_closer" unless closer.kind_of? Closer
      warning_closer = warning_closers.where(:closer_id => closer.id).first
      warning_closer.send(symbol) if warning_closer
    end

    def acts_as_list_method?(symbol)
      ActiveRecord::Acts::List::InstanceMethods.instance_methods.include?(symbol.to_sym)
    end
    
  end
end
