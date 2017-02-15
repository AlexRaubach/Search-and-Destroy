class GamesController < ApplicationController
  def index
    @games = Games.all
  end

  def new
  end

  def show
  end
end
