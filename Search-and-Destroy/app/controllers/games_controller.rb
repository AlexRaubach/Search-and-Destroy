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
      redirect_to "/games/#{@game.id}/waiting"
    end

  end

  def delete
  end


  def place
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    if @game.current_player_id != session[:user_id]
      if @game.boards.first.user_id == session[:user_id]
          @my_board = @game.boards.first
          @opponent_board = @game.boards.last
        else
          @my_board = @game.boards.last
          @opponent_board = @game.boards.first
        end
      @opponent_board.fire_on(params[:attack_coordinates])
      @opponent_board.save
      @game.current_player_id = session[:user_id]
      @game.save
    end
    redirect_to "/games/#{@game.id}"
  end

  def waiting
    @game = Game.find(params[:id])
  end


  private

end
