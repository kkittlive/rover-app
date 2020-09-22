# frozen_string_literal: true

class View
  def self.ask_plateau_size
    puts ''
    puts '--------'
    puts 'How many coordinates wide and tall would you like this plateau to be?'
    puts "(e.g. for 5 x 5, type '5 5' and hit enter)"
    print '> '
    size = gets.chomp.split
    puts "Right on! So our plateau is #{size[0]} wide (x-axis) by #{size[1]} tall (y-axis)."

    return size
  end

  def self.ask_start_xy(results, plateau_size)
    puts ''
    puts '--------'
    puts 'Where on this plateau would you like your rover to be plopped, and facing which direction?'
    if results.empty?
      puts "You can enter any coordinates from '0 0 ' up to '#{plateau_size[0]} #{plateau_size[1]}',"
      puts "and you can specify the direction with either 'N', 'E', 'S', or 'W'."
      puts "So we'll want to enter something like: '1 2 N' or '3 3 E'."
    end
    print '> '

    gets.chomp.split.map! { |character| character =~ /\d/ ? character.to_i : character }
  end
end
