module Ominous
  class Closer < ActiveRecord::Base
    attr_accessible :name, :url, :closure_method, :start_hidden
    
    CLOSURE_METHODS = {
      :reveal_hidden => 'Hides the current closers and reveals any hidden closers', 
      :close_and_dismiss_warning => 'Closes the warning message and tells server not to display warning again', 
      :redirect => 'Link to take user to closer.url without clearing the warning' 
    }    
    
    validates :name, :presence => true
    validates :closure_method, :inclusion => { :in => CLOSURE_METHODS.keys.collect(&:to_s) }
    
    def self.closure_methods
      CLOSURE_METHODS
    end

  end
end
