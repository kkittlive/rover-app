# frozen_string_literal: true

require_relative 'view'
require_relative 'plateau'
require_relative 'rover'
require_relative 'route'

class Controller
  def initialize
    @continue = 'Y'
    @results = []
  end

  def execute
    puts '------------------------------------------------'
    puts "Welcome to jkwan's Mars Rover app."

    size = View.ask_plateau_size
    @plateau = Plateau.new(size)

    while @continue == 'Y'
      start_xy = View.ask_start_xy(@results, @plateau.size)
      @rover = Rover.new(start_xy)

      path = View.ask_route(@results, @rover.start_xy)
      @route = Route.new(path)

      @results << @rover.calculate_endpoint(@route.path, @plateau.size)
      @continue = View.ask_to_continue
    end

    View.show_results(@results)
  end
end
