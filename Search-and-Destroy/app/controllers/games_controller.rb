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
    @board = @game.games_user.find(user: 1 )#current_user)
  end

  def delete
  end

  def update
    # params[:position_selected]
    # g = Game.find(params[:game_id])
      # g.fire
  end

  private

end
