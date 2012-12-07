module Ominous
  class Engine < ::Rails::Engine
    isolate_namespace Ominous
    
    initializer 'ominous.action_controller' do |app|
      ActiveSupport.on_load :action_controller do
        helper Ominous::ApplicationHelper
      end
    end
    
#    initializer "ominous.assets.precompile" do |app|
#      app.config.assets.precompile += %w(_ominous_colours.scss application.scss warnings.scss)
#    end
  end
end

