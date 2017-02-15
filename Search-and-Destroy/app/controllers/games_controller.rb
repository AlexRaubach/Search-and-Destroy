class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def create
  end

  def show
  end

  def delete
  end

  private

end
