module Ominous
  module ApplicationHelper
    def ominous_warnings
      process_ominous_warnings
      if ominous_warnings_to_show?
        content_tag(
          'div', 
          render(
            :partial => 'ominous/warnings/list',
            :locals => {:warnings => ominous_warning_to_display}
          ), 
          :class => 'ominous_warnings')
      end
    end
    
    def process_ominous_warnings
      Warning.requests.each do |request| 
        ominous_session_store[request.to_sym] = :show unless ominous_session_store[request.to_sym]
      end
      Warning.clear_requests
    end
    
    def ominous_warnings_to_show?
      ominous_session_store.values.include? :show
    end
    
    def ominous_session_store
      session[:ominous_warnings] ||= {}
    end
    
    def ominous_warning_to_display
      warnings = ominous_session_store.keys.collect do |name| 
        Warning.find_by_name(name) if ominous_session_store[name] == :show
      end
      return warnings.compact
    end
  end
end
