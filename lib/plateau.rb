# frozen_string_literal: true

require_relative 'view'

class Plateau
  attr_reader :size

  def initialize
    @size = []
  end

  def set_plateau_size
    @size = View.ask_plateau_size
  end
end
