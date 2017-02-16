class Board < ApplicationRecord
  belongs_to :user
  belongs_to :game

  before_save :generate_board

  # validates :patrol_location, :sub_location, :carrier_location, :battleship_location, :destroyer_location, presence: true

  # validate :all_ship_shape

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

  # [A0, A1, A2]

  def all_length_check
    return false if self.patrol_location.split(" ").length != 2
    return false if self.sub_location.split(" ").length != 3
    return false if self.destroyer_location.split(" ").length != 3
    return false if self.battleship_location.split(" ").length != 4
    return false if self.carrier_location.split(" ").length != 5

    true
  end

  def get_letters(array)
    letters = []
    array.each {|coord| letters << coord[0]}
    letters.downcase.sort!
  end

  def get_numbers(array)
    numbers = []
    array.each {|coord| letters << coord[1]}
    numbers.sort!
  end

  def horizontal_check(string)
    coordinates = string.split(" ")
    letters = get_letters(coordinates)
    return false if letters.uniq.length > 1

    numbers = get_numbers(coordinates)
    numbers.each_cons(2).all? {|a, b| b == a + 1}
  end

  def vertical_check(string)
    coordinates = string.split(" ")
    numbers = get_numbers(coordinates)
    return false if numbers.uniq.length > 1

    letters = get_letters(coordinates)
    letters.each_cons(2).all? {|a, b| b.ord == a.ord + 1}
  end

  def all_unique
    ship_positions = get_all_ship_positions
    return true if ship_positions.uniq.length == ship_positions.length

    false
  end

  def all_horizontal_and_vertical
    (horizontal_check(self.patrol_location) || vertical_check(self.patrol_location)) && (horizontal_check(self.sub_location) || vertical_check(self.sub_location)) && (horizontal_check(self.carrier_location) || vertical_check(self.carrier_location)) && (horizontal_check(self.battleship_location) || vertical_check(self.battleship_location)) && (horizontal_check(self.destroyer_location) || vertical_check(self.destroyer_location))
  end


  def all_ship_shape
    all_unique && all_length_check && all_horizontal_and_vertical
  end
end
