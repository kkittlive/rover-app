# frozen_string_literal: true

require_relative 'view'

class Rover
  attr_reader :start_xy, :route

  def initialize
    @start_xy = []
  end

  def set_start_xy(results, plateau_size)
    @start_xy = View.ask_start_xy(results, plateau_size)
  end

  def set_route(results, start_xy)
    @route = View.ask_route(results, start_xy)
  end

  def calculate_endpoint(plateau_size)
    current_xy = start_xy

    route.split('').each do |step|
      case step
      when 'L', 'R'
        rotate(current_xy, step)
      when 'M'
        move(current_xy, plateau_size)
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

  def move(current_xy, plateau_size)
    case current_xy[2]
    when 'N'
      current_xy[1] += 1 if current_xy[1] < plateau_size[1]
    when 'E'
      current_xy[0] += 1 if current_xy[0] < plateau_size[0]
    when 'S'
      current_xy[1] -= 1 if current_xy[1] > 0
    when 'W'
      current_xy[0] -= 1 if current_xy[0] > 0
    end
  end
end
