# frozen_string_literal: true

require_relative 'view'

class Controller
  def initialize
    @plateau = Plateau.new
    @view = View.new
    @rover = Rover.new
    # @rover_start_xy = []
    @results = []
  end

  def execute
  end
end
