require 'minitest/autorun'
require './lib/plateau'
require 'pry-byebug'

class TestPlateau < Minitest::Test
  def setup
    @plateau = Plateau.new([5, 5])
  end

  def test_that_plateau_is_valid_when_supplied_valid_size
    assert_equal true, @plateau.size.is_a?(Array)
  end

  def test_that_plateau_is_invalid_when_supplied_invalid_size
    @plateau_invalid = Plateau.new('5 5')
    assert_equal false, @plateau_invalid.size.is_a?(Array)
  end

  def test_that_size_is_immutable
    assert_raises do
      @plateau.size = '5 5'
    end
  end

  # def test_that_kitty_can_eat
  #   assert_equal "OHAI!", @meme.i_can_has_cheezburger?
  # end

  # def test_that_it_will_not_blend
  #   refute_match /^no/i, @meme.will_it_blend?
  # end

  # def test_that_will_be_skipped
  #   skip "test this later"
  # end
end
