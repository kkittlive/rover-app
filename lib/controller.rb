# frozen_string_literal: true

require_relative 'view'
require_relative 'plateau'
require_relative 'rover'

class Controller
  def initialize
    @view = View.new
    @plateau = Plateau.new
    @rover = Rover.new
    @continue = 'Y'
    @results = []
  end

  def execute
    puts '------------------------------------------------'
    puts "Welcome to jkwan's Mars Rover app."

    @plateau.set_plateau_size

    while @continue == 'Y'
      # reset
      @rover.set_start_xy(@results, @plateau.plateau_size)
      # set_route
      # calculate_endpoint
      # ask_to_continue
    end

    # show_results
  end
end
