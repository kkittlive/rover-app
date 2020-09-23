# frozen_string_literal: true

require 'minitest/autorun'
require './lib/controller'
require 'pry-byebug'

class TestController < Minitest::Test
  def setup
    @controller = Controller.new
  end

  def test_that_continue_is_an_accessible_attribute
    assert_equal 'Y', @controller.continue
  end

  def test_that_results_is_an_accessible_attribute
    assert_equal [], @controller.results
  end
end
