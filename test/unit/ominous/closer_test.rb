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
    
    def test_default_link_text
      @closer.link_text = nil
      Closer.closure_methods.keys.each do |closure_method|
        @closer.closure_method = closure_method
        @closer.save
        link_text = "Click here to #{closure_method.to_s}".humanize
        assert_equal(link_text, @closer.link_text)
      end
    end
    
    def test_default_link_text_with_empty_string
      @closer.link_text = " "
      closure_method = Closer.closure_methods.keys.first
      @closer.closure_method = closure_method
      @closer.save
      link_text = "Click here to #{closure_method.to_s}".humanize
      assert_equal(link_text, @closer.link_text)   
    end
    
  end
end
