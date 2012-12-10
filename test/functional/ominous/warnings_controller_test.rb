require 'test_helper'

module Ominous
  class WarningsControllerTest < ActionController::TestCase
    
    def setup
      @warning = Ominous::Warning.find(1)
      @routes = Engine.routes # Added so that test action is matched to correct route
    end

    
    def test_dismiss
      put(
        :dismiss,
        {id: @warning},
        {:ominous_warnings => {@warning.name.to_sym => :show}}
      )
      assert_equal(:hide, session[:ominous_warnings][@warning.name.to_sym])
    end
    
  end
end
