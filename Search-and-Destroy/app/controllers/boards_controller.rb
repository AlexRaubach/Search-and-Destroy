class BoardsController < ApplicationController
   def create
    @game = Game.find(params["id"])
    @board = @game.boards.find_or_initialize_by(user_id: session[:user_id])

    if @board.save(games_params)
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
