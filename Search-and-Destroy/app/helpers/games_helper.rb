module GamesHelper
  def set_my_board(game, user_id)
    if game.boards.first.user_id == user_id
      my_board = game.boards.first
    else
      my_board = game.boards.last
    end
    my_board
  end

  def set_opponent_board(game, user_id)
    if game.boards.first.user_id == user_id
      opponent_board = game.boards.last
    else
      opponent_board = game.boards.first
    end
    opponent_board
  end
end
