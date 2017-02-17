  class CreateBoards < ActiveRecord::Migration[5.0]
  def change
    create_table :boards do |t|
      t.integer :user_id
      t.integer :game_id
      t.json :board_state
      t.string :patrol_location, default: '0,0'
      t.string :sub_location, default: '0,0'
      t.string :carrier_location, default: '0,0'
      t.string :battleship_location,default: '0,0'
      t.string :destroyer_location, default: '0,0'

      t.timestamps
    end
  end
end


