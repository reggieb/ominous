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

  end
end
