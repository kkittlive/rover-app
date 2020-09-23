# frozen_string_literal: true

require 'minitest/autorun'
require './lib/route'
require 'pry-byebug'

class TestRoute < Minitest::Test
  def setup
    @route = Route.new('LMLMLMLMM')
  end

  def test_that_path_is_an_accessible_attribute
    assert_equal 'LMLMLMLMM', @route.path
  end
end
