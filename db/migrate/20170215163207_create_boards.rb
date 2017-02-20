  class CreateBoards < ActiveRecord::Migration[5.0]
  def change
    create_table :boards do |t|
      t.integer :user_id
      t.integer :game_id
      t.json :board_state
      t.string :patrol_location, default: 'A0 A1'
      t.string :sub_location, default: 'B0 B1 B2'
      t.string :carrier_location, default: 'C0 C1 C2 C3 C4'
      t.string :battleship_location,default: 'D0 D1 D2 D3'
      t.string :destroyer_location, default: 'E0 E1 E2'

      t.timestamps
    end
  end
end


