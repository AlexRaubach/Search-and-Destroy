class BoardsController < ApplicationController
   def update
    @board = Board.where(game_id: params["id"], user_id: sessions[:user_id])
    @game = Game.find(params["id"])

    if @board.update(games_params)
      redirect_to game_path(@game)
    else
      render 'place'
    end
  end

  private

  def board_params
    params.require(:board).permit(:patrol_location, :sub_location, :carrier_location, :battleship_location, :destroyer_location)
  end

end
