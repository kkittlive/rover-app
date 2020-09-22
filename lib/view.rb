# frozen_string_literal: true

class View
  def self.ask_plateau_size
    puts '--------'
    puts 'How many coordinates wide and tall would you like this plateau to be?'
    puts "(e.g. for 5 x 5, type '5 5' and hit enter)"
    print '> '
    gets.chomp
  end
end
