module Ominous
  module ApplicationHelper
    def ominous_warnings
      process_ominous_warnings
      if warnings_to_show?
        content_tag(
          'div', 
          render(
            :partial => 'ominous/warnings/list',
            :locals => {:warnings => warning_to_display}
          ), 
          :class => 'ominous_warnings')
      end
    end
    
    def process_ominous_warnings
      Warning.requests.each do |request| 
        session_store[request.to_sym] = :show unless session_store[request.to_sym]
      end
      Warning.clear_requests
    end
    
    def warnings_to_show?
      session_store
      session_store.values.include? :show
    end
    
    def session_store
      session[:ominous_warnings] ||= {}
    end
    
    def warning_to_display
      warnings = session_store.keys.collect do |name| 
        Warning.find_by_name(name) if session_store[name] == :show
      end
      return warnings.compact
    end
  end
end
