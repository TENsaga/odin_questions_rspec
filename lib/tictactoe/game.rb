class Game
  require './player.rb'
  require './board.rb'

  def initialize(p1 = nil, p2 = nil)
    if p1.nil?
      setup
    else
      @p1 = p1
      @p2 = p2
    end
  end

  def setup
    print "\n[  Welcome to Tic-Tac-Toe  ]\n\n"
    @p1 = Player.new
    @p2 = Player.new
    print "\nLet's Begin!\n"
  end

  def play
    # Skip setup for testing purposes
    # @p1 = Player.new("joe", "[x]", "yes")
    # @p2 = Player.new("bob", "[o]", "yes")
    @bor = Board.new(@p1, @p2)
    num_turns = 1
    @player_turn = [@p1.name, @p2.name]
    while num_turns < 10
      @bor.update_board(set_input, @player_turn[0])
      set_replay if set_win?
      num_turns += 1
      @player_turn.rotate!
    end
    print "\nDraw!"
    set_replay
  end

  def set_input
    begin
      print @bor.print_board.to_s
      set_location
    rescue RuntimeError => e
      print e
      retry
    end
  end

  def set_location
    print "\n#{@player_turn[0]}: Where would you like to play? (1-9)\n\n>"
    location = gets.chomp.to_i
    raise "\nNumber must be between 1 and 9...\n" unless location.between?(1, 9)
    raise "\nSpot already taken!\n" if @bor.board[location - 1] =~ /#{@p1.symbol}|#{@p2.symbol}/
    location
  end

  def set_win?
    result = @bor.determin_win
    return unless result
    print "\n#{@player_turn[0]} #{result} Wins!  \n\n"
    @bor.print_board
    true
  end

  def set_replay
    print "\nPlay Again? (y/n)"
    if gets.chomp == 'y'
      game = Game.new(@p1, @p2)
      game.play
    end
    print "\nGame Over\n"
    exit
  end
end
