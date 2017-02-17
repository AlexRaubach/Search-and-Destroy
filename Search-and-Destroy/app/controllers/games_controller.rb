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
    p session[:user_id]
    p params[:id]
    @game = Game.find(params[:id])
    # @board = @game.boards.first
    if @game.boards.count >= 2
      if @game.boards.first.user_id == session[:user_id]
        @my_board = @game.boards.first
        @opponent_board = @game.boards.last
      else
        @my_board = @game.boards.last
        @opponent_board = @game.boards.first
      end
    else
      #redirect to waiting page
    end

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
