class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def create
  end

  def join
  end

  def show
    @game = Game.find(params[:id])
    @board = @game.games_user.find(user: current_user)
  end

  def delete
  end

<<<<<<< HEAD
  def place
=======
  def update
    # params[:position_selected]
    # g = Game.find(params[:game_id])
      # g.fire
>>>>>>> 400b666884d6169af96f3cf4170115a8b47be321
  end

  private

end
