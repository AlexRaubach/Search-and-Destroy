class GamesController < ApplicationController
  include GamesHelper
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
    if @game.boards.count >= 2
      @my_board = set_my_board(@game, session[:user_id])
      @opponent_board = set_opponent_board(@game, session[:user_id])
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
      @opponent_board = set_opponent_board(@game, session[:user_id])
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

  def status
    @game = Game.find(params[:id])
      #binding.pry
    if @game.current_player_id == session[:user_id]
      puts "status 200 player turn"
      render plain: "200"
      # format.json  { render :json => @person, :status => :ok }
    else
      puts "status 202 not player turn"
      render plain: "202"
      #format.json { render :json => msg }
    end
  end

  private

end
