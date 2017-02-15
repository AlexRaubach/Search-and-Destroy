class GamesUser < ApplicationRecord

  before_save :generate_board

  def generate_board
    row_array = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    board_hash = {
      "row_A": row_array.dup,
      "row_B": row_array.dup,
      "row_C": row_array.dup,
      "row_D": row_array.dup,
      "row_E": row_array.dup,
      "row_F": row_array.dup,
      "row_G": row_array.dup,
      "row_H": row_array.dup,
      "row_I": row_array.dup,
      "row_J": row_array.dup
    }
    self.board_state = board_hash
  end

  def get_all_ship_positions
    ship_positions = []
    ship_positions += self.patrol_location.split(" ")
    ship_positions += self.sub_location.split(" ")
    ship_positions += self.carrier_location.split(" ")
    ship_positions += self.battleship_location.split(" ")
    ship_positions += self.destroyer_location.split(" ")
  end

  def check_for_game_loss
    positions = self.get_all_ship_positions
    positions.each do |position|
      return false if self.board_state["row_#{position[0]}"][position[1]] == 0
    end
    return true
  end
end
