# frozen_string_literal: true

require_relative 'view'

class Rover
  attr_reader :start_xy, :route

  def initialize
    reset
  end

  def reset
    @start_xy = []
    @route = ''
  end

  def set_start_xy(results, plateau_size)
    @start_xy = View.ask_start_xy(results, plateau_size)
  end

  def set_route(results, start_xy)
    @route = View.ask_route(results, start_xy)
  end

  def calculate_endpoint
    current_xy = start_xy

    route.split('').each do |step|
      case step
      when 'L', 'R'
        rotate(current_xy, step)
      when 'M'
        move(current_xy)
      end
    end

    current_xy
  end

  private

  def rotate(current_xy, step)
    directions = %w[N E S W]
    position = directions.index(current_xy[2])

    if step == 'L'
      current_xy[2] = directions.rotate!(-1)[position]
    elsif step == 'R'
      current_xy[2] = directions.rotate(1)[position]
    end
  end

  def move(current_xy)
    case current_xy[2]
    when 'N'
      current_xy[1] += 1
    when 'E'
      current_xy[0] += 1
    when 'S'
      current_xy[1] -= 1
    when 'W'
      current_xy[0] -= 1
    end
  end
end
