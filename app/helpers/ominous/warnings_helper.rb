module Ominous
  module WarningsHelper
    def classes_for(closer)
      classes = ['closer']
      classes << visibility(closer.start_hidden?)
      classes.join(' ')
    end
    
    def visibility(truth)
      truth ? 'start_hidden' : 'start_visible'
    end
    
    def closer_link_to(warning, closer)
      text = t("ominous.warning.#{warning.name}.#{closer.name}.link") 
      link_class = closer.closure_method
      url = closer_url(warning, closer)
      link_to(text, url, :method => :put, :class => link_class)
    end
    
    def closer_url(warning, closer)
      if closer.closure_method == 'close_and_hide_warning'
        ominous.dismiss_warning_path(warning)
      else
        return closer.url
      end
    end

  end
end
