class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def new
    @game = Game.create
    redirect_to "/games/#{@game.id}/place"
  end

  def create
    @game = Game.create
  end

  def join
  end

  def show
    @game = Game.find(params[:id])
    @board = @game.boards.find(user: current_user)
  end

  def delete
  end


  def place
    @game = Game.find(params[:id])
  end

  def update
    # params[:position_selected]
    # g = Game.find(params[:game_id])
    # g.fire
  end

  private

end
