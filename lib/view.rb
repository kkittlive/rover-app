# frozen_string_literal: true

class View
  def self.gets_chomp
    gets.chomp
  end

  def self.ask_plateau_size
    puts ''
    puts '--------'
    puts 'How many coordinates wide and tall would you like this plateau to be?'
    puts "(e.g. for 5 x 5, type '5 5' and hit enter)"
    print '> '

    size = View.gets_chomp
    until size.match(/\A\d \d\z/)
      print 'Bad format - try again: '
      size = gets_chomp
    end

    puts "Right on! So our plateau is #{size.split[0]} wide (x-axis) by #{size.split[1]} tall (y-axis)."
    size.split.map!(&:to_i)
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

    xy = gets_chomp
    until xy.match(/\A\d \d [A-Z]\z/) && xy[0].to_i <= plateau_size[0] && xy[2].to_i <= plateau_size[1]
      print 'Bad format - try again: '
      xy = gets_chomp
    end

    xy.split.map! { |character| character =~ /\d/ ? character.to_i : character }
  end

  def self.ask_route(results, start_xy)
    puts ''
    puts '--------'
    puts "Awesome. So starting from x = #{start_xy[0]} and y = #{start_xy[1]}, facing #{start_xy[2]}, what's the route we'd like this rover to navigate?"
    if results.empty?
      puts "We can type 'L' for the rover to turn left (rotate 90deg counter-clockwise, without otherwise moving),"
      puts "'R' to turn right, and 'M' to move forward one step (in the direction they're already facing)."
      puts "Any M's that will cause the rover to fall off the plateau will be skipped"
      puts "So we'll want to enter something like: 'LMLMLMLMM' or 'MMRMMRMRRM'."
    end
    print '> '

    route = gets_chomp
    until route.match(/\A[LRM]+\z/)
      print 'Bad format - try again: '
      route = gets_chomp
    end

    route
  end

  def self.ask_to_continue
    puts ''
    puts '--------'
    puts "Would you like to plop another rover on this plateau? Enter 'Y' or 'N'"
    print '> '

    continue = gets_chomp
    until continue.match(/\A[YN]\z/)
      print 'Bad format - try again: '
      continue = gets_chomp
    end

    continue
  end

  def self.show_results(results)
    puts ''
    puts '--------'
    puts 'Here are the resulting whereabouts of your rover(s):'

    results.each do |result|
      puts result.join(' ')
    end

    puts 'Thanks for visiting Mars!'
    puts '------------------------------------------------'
  end
end
