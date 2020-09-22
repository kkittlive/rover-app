# frozen_string_literal: true

require_relative 'view'

class Rover
  def initialize
    reset
  end

  def reset
    @rover_start_xy = []
    @rover_route = ''
  end

  def set_start_xy(results, plateau_size)
    @rover_start_xy = View.ask_start_xy(results, plateau_size)
  end
end
