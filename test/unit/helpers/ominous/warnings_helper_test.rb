require 'test_helper'

module Ominous
  class WarningsHelperTest < ActionView::TestCase
    
    def setup
      @warning = Ominous::Warning.find(1)
      @closer = @warning.closers.find(1)
    end

    def test_classes_for_when_closer_hidden
      @closer.update_attribute(:start_hidden, true)
      expected = 'closer start_hidden'
      assert_equal(expected, ominous_classes_for(@closer))
    end

    def test_classes_for_when_closer_visible
      @closer.update_attribute(:start_hidden, false)
      expected = 'closer start_visible'
      assert_equal(expected, ominous_classes_for(@closer))
    end

    def test_ominous_closer_url
      closer = @warning.closers.find(2)
      assert_equal closer.url, ominous_closer_url(@warning, closer)
    end

    def test_ominous_closer_url_when_closer_close_and_dismiss_warning
      assert_match /ominous\/warnings\/\d+\/dismiss/, ominous_closer_url(@warning, @closer)
      assert_match /^http/, ominous_closer_url(@warning, @closer)
    end
    
  end
end
