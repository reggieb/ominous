module Ominous
  module ApplicationHelper
    def ominous_warnings
      check_ominous_warnings
      if session[:ominous_warnings]
        content_tag('div', 'Warning', :class => 'ominous_warning')
      end
    end
    
    def check_ominous_warnings
      Warning.requests.each{|request| session_store << request}
      Warning.clear_requests
    end
    
    def session_store
      session[:ominous_warnings] ||= []
    end
  end
end
