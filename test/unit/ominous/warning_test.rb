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
  end
end
