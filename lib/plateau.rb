# frozen_string_literal: true

require_relative 'view'

class Plateau
  attr_reader :plateau_size

  def initialize
    @plateau_size = []
  end

  def set_plateau_size
    @plateau_size = View.ask_plateau_size
  end
end
