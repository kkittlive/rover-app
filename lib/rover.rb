# frozen_string_literal: true

class Rover
  attr_accessor :start_xy, :current_xy

  def initialize(start_xy)
    @start_xy = start_xy
  end

  def calculate_endpoint(route_path, plateau_size)
    @current_xy = start_xy

    route_path.split('').each do |step|
      case step
      when 'L', 'R'
        @current_xy = rotate(@current_xy, step)
      when 'M'
        @current_xy = move(@current_xy, plateau_size)
      end
    end

    current_xy
  end

  def rotate(current_xy, step)
    directions = %w[N E S W]
    position = directions.index(current_xy[2])

    if step == 'L'
      current_xy[2] = directions.rotate!(-1)[position]
    elsif step == 'R'
      current_xy[2] = directions.rotate(1)[position]
    end

    current_xy
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

    current_xy
  end
end
