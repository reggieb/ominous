require 'test_helper'

module Ominous
  class CloserTest < ActiveSupport::TestCase
    def setup
      @warning = Warning.find(1)
      @closer = Closer.find(1)
    end
    
    def test_setup
      assert(@warning.closers.include?(@closer))
    end
    
    def test_adding_closer_again_does_not_add_duplicate
      assert_raise ActiveRecord::RecordInvalid do
        @warning.closers << @closer
      end
    end
  end
end
