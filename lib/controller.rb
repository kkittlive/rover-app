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
      @rover.set_start_xy(@results, @plateau.size)
      @rover.set_route(@results, @rover.start_xy)
      @results << @rover.calculate_endpoint(@plateau.size)
      @continue = View.ask_to_continue
    end

    View.show_results(@results)
  end
end
