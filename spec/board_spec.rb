require_relative '../lib/tictactoe/board.rb'
require_relative '../lib/tictactoe/player.rb'

describe "TicTacToe" do
  let(:player_one) { Player.new("joe", "[x]", "yes") }
  let(:player_two) { Player.new("bob", "[o]", "yes") }

  # Testing Board
  describe Board do
    before(:each) do
      @board = Board.new(player_one, player_two)
    end

    context "attributes" do
      it "responds to board" do
        expect(@board).to respond_to(:board)
      end

      it "fails response to remaining attributes" do
        expect(@board).to_not respond_to(:empty_cell)
        expect(@board).to_not respond_to(:player_one_name)
        expect(@board).to_not respond_to(:player_two_name)
        expect(@board).to_not respond_to(:player_one_sym)
        expect(@board).to_not respond_to(:player_two_sym)
        expect(@board).to_not respond_to(:play)
      end
    end

    context "#print_board" do
      it "prints board" do
        expect { @board.print_board }.to output("[_][_][_]\n[_][_][_]\n[_][_][_]\n").to_stdout
      end
    end

    context "#update_board" do
      it "adds player symbol to board cell" do
        @board.update_board(2, player_one.name)
        expect(@board.board).to eq(["[_]", "[x]", "[_]",
                                    "[_]", "[_]", "[_]",
                                    "[_]", "[_]", "[_]"])
      end
    end

    describe "#determin_win" do
      context "player one row x" do
        it "declares player one winner" do
          @board.update_board(1, player_one.name)
          @board.update_board(2, player_one.name)
          @board.update_board(3, player_one.name)
          expect(@board.determin_win).to eq "x"
        end
      end

      context "player one col x" do
        it "declares player one winner" do
          @board.update_board(1, player_one.name)
          @board.update_board(4, player_one.name)
          @board.update_board(7, player_one.name)
          expect(@board.determin_win).to eq "x"
        end
      end

      context "player two row o" do
        it "declares player two winner" do
          @board.update_board(1, player_two.name)
          @board.update_board(2, player_two.name)
          @board.update_board(3, player_two.name)
          expect(@board.determin_win).to eq "o"
        end
      end

      context "player two col o" do
        it "declares player two winner" do
          @board.update_board(1, player_two.name)
          @board.update_board(4, player_two.name)
          @board.update_board(7, player_two.name)
          expect(@board.determin_win).to eq "o"
        end
      end
    end
  end

  # Testing Player
  describe Player do
    describe "attributes" do
      context "player_one" do
        it "responds to all" do
          expect(player_one).to respond_to(:name)
          expect(player_one).to respond_to(:symbol)
          expect(player_one).to respond_to(:win_pattern)
        end
      end

      context "player_two" do
        it "responds to all" do
          expect(player_two).to respond_to(:name)
          expect(player_two).to respond_to(:symbol)
          expect(player_two).to respond_to(:win_pattern)
        end
      end
    end
  end
end
