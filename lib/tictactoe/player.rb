class Player
  attr_reader :name, :win_pattern, :symbol

  @@possible = ["x", "o"]
  @@player_num = [1, 2]

  def initialize(name = nil, symbol = nil, skip = nil)
    if skip
      @name = name
      @symbol = symbol
    else
      @name = set_name
      @symbol = set_symbol
    end
    @win_pattern = set_win_pattern
    @@player_num.rotate!
  end

  private

  def set_name
    print "\nPlayer - #{@@player_num[0]}, what's your name?\n>"
    gets.chomp
  end

  def set_symbol
    if @@possible.length == 2
      begin
        print "\n#{@name}, \"x\" or \"o\"?\n>"
        symbol = gets.chomp
        raise unless @@possible.include?(symbol)
      rescue
        print "\nErorr:\tYou must choose \"x\" or \"o\"\n"
        retry
      end
      @@possible.delete(symbol)
    else
      symbol = @@possible.first
    end
    print "\n#{@name}, you're: #{symbol}"
    "[#{symbol}]"
  end

  def set_win_pattern
    pattern = ''
    3.times { pattern += @symbol }
    pattern
  end
end
