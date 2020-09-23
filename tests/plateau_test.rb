# frozen_string_literal: true

require 'minitest/autorun'
require './lib/plateau'
require 'pry-byebug'

class TestPlateau < Minitest::Test
  def setup
    @plateau = Plateau.new([5, 5])
  end

  def test_that_size_is_an_accessible_attribute
    assert_equal [5, 5], @plateau.size
  end
end
