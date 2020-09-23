# frozen_string_literal: true

require_relative 'view'
require_relative 'plateau'
require_relative 'rover'
require_relative 'route'

class Controller
  attr_accessor :continue, :results

  def initialize
    @continue = 'Y'
    @results = []
  end

  def execute
    puts '------------------------------------------------'
    puts "Welcome to jkwan's Mars Rover app."

    size = View.ask_plateau_size
    @plateau = Plateau.new(size)

    while continue == 'Y'
      start_xy = View.ask_start_xy(results, @plateau.size)
      @rover = Rover.new(start_xy)

      path = View.ask_route(results, @rover.start_xy)
      @route = Route.new(path)

      @rover.calculate_endpoint(@route.path, @plateau.size)
      results << @rover.current_xy
      self.continue = View.ask_to_continue
    end

    View.show_results(results)
  end
end
