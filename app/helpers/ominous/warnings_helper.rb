module Ominous
  module WarningsHelper
    def ominous_classes_for(closer)
      classes = ['closer']
      classes << ominous_visibility(closer.start_hidden?)
      classes.join(' ')
    end
    
    def ominous_visibility(truth)
      truth ? 'start_hidden' : 'start_visible'
    end
    
    def ominous_closer_link_to(warning, closer)
      text = closer.link_text 
      link_class = closer.closure_method
      url = ominous_closer_url(warning, closer)
      link_to(text, url, :method => :put, :class => link_class)
    end
    
    def ominous_closer_url(warning, closer)
      if closer.closure_method == 'close_and_dismiss_warning'
        ominous.dismiss_warning_path(warning)
      else
        return closer.url
      end
    end

  end
end
