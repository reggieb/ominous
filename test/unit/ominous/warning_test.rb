require 'test_helper'

module Ominous
  class WarningTest < ActiveSupport::TestCase
    def setup
      @warning = Warning.find(1)
      @closer = Closer.find(1)
    end
    
    def test_join_to_closer
      assert_equal(@closer, @warning.closers.find_by_id(@closer.id))
    end
    
    def test_requests
      assert_equal([], Warning.requests)
    end
    
    def test_trigger
      Warning.trigger(@warning.name)
      assert_equal([@warning.name.to_sym], Warning.requests)
    end
    
    def test_trigger_with_non_existent_warning
      assert_raise RuntimeError do
        Warning.trigger(:does_not_exist)
      end
    end
  end
end
