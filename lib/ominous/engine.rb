module Ominous
  class Engine < ::Rails::Engine
    isolate_namespace Ominous
    
    initializer 'ominous.action_controller' do |app|
      ActiveSupport.on_load :action_controller do

        helper Ominous::ApplicationHelper
        helper Ominous::WarningsHelper

        after_filter 'Ominous::Warning.after_action_tasks'
             
      end
    end
   
  end
end

