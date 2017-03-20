# Board
# [~][~][~]
# [~][~][~]
# [~][~][~]

class Board
  attr_reader :board

  def initialize(p1, p2)
    @empty_cell = '[_]'
    @player_one_name = p1.name
    @player_two_name = p2.name
    @player_one_sym = p1.symbol
    @player_two_sym = p2.symbol
    @play = [] << p1.win_pattern << p2.win_pattern
    @board = []
    9.times { @board << @empty_cell }
  end

  def print_board
    ind = 0
    board = ''
    3.times do
      3.times do
        board += @board[ind].to_s
        ind += 1
      end
      board += "\n"
    end
    print board
  end

  def update_board(location, player)
    piece = if player == @player_one_name
              @player_one_sym
            else
              @player_two_sym
            end
    @board[location - 1] = piece
  end

  def determin_win
    winner = ''
    @play.each_with_index do |x, index|
      winner = x if @board.values_at(0, 1, 2).join == @play[index]
      winner = x if @board.values_at(3, 4, 5).join == @play[index]
      winner = x if @board.values_at(6, 7, 8).join == @play[index]
      winner = x if @board.values_at(0, 3, 6).join == @play[index]
      winner = x if @board.values_at(1, 4, 7).join == @play[index]
      winner = x if @board.values_at(2, 5, 8).join == @play[index]
      winner = x if @board.values_at(0, 4, 8).join == @play[index]
      winner = x if @board.values_at(2, 4, 6).join == @play[index]
    end
    winner.empty? ? false : winner[1].to_s
  end
end
