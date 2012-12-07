module Ominous
  class ApplicationController < ActionController::Base
    
    protected
    def check_ominous_warnings
      Warning.requests.each{|request| session_store << request}
      Warning.clear_requests
    end
    helper_method :check_ominous_warnings
    
    def session_store
      session[:ominous_warnings] ||= []
    end
    
  end
end
