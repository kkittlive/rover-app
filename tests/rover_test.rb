# frozen_string_literal: true

require 'minitest/autorun'
require './lib/rover'
require './lib/plateau'
require './lib/route'
require 'pry-byebug'

class TestRover < Minitest::Test
  def setup
    @rover = Rover.new([1, 2, 'N'])
    @plateau = Plateau.new([5, 5])
    @route = Route.new('LMLMLMLMM')
  end

  def test_that_start_xy_is_an_accessible_attribute
    assert_equal [1, 2, 'N'], @rover.start_xy
  end

  def test_that_calculate_endpoint_returns_the_correct_value
    assert_equal [1, 3, 'N'], @rover.calculate_endpoint(@route.path, @plateau.size)
  end

  def test_that_rotate_left_returns_the_correct_value
    assert_equal [1, 2, 'W'], @rover.rotate([1, 2, 'N'], 'L')
  end

  def test_that_rotate_right_returns_the_correct_value
    assert_equal [1, 2, 'E'], @rover.rotate([1, 2, 'N'], 'R')
  end

  def test_that_invalid_rotate_input_returns_unchanged_xy
    assert_equal [1, 2, 'N'], @rover.rotate([1, 2, 'N'], 'M')
  end

  def test_that_move_is_applied_in_the_proper_direction
    assert_equal [1, 3, 'N'], @rover.move([1, 2, 'N'], @plateau.size)
  end

  def test_that_move_is_ignored_if_exceeds_plateau_bounds
    assert_equal [1, 5, 'N'], @rover.move([1, 5, 'N'], @plateau.size)
    assert_equal [1, 0, 'S'], @rover.move([1, 0, 'S'], @plateau.size)
    assert_equal [5, 2, 'E'], @rover.move([5, 2, 'E'], @plateau.size)
    assert_equal [0, 2, 'W'], @rover.move([0, 2, 'W'], @plateau.size)
  end
end
