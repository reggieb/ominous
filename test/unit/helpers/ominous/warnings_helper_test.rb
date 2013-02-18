require 'test_helper'

module Ominous
  class WarningsHelperTest < ActionView::TestCase
    
    def setup
      @warning = Ominous::Warning.find(1)
      @closer = @warning.closers.first
    end

    def test_classes_for_when_closer_hidden
      @closer.update_attribute(:start_hidden, true)
      expected = 'closer start_hidden'
      assert_equal(expected, classes_for(@closer))
    end

    def test_classes_for_when_closer_visible
      @closer.update_attribute(:start_hidden, false)
      expected = 'closer start_visible'
      assert_equal(expected, classes_for(@closer))
    end  
    
  end
end
