class CreateGamesUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :games_users do |t|
      t.integer :user_id
      t.integer :game_id
      t.json :board_state
      t.string :patrol_location
      t.string :sub_location
      t.string :carrier_location
      t.string :battleship_location
      t.string :destroyer_location

      t.timestamps
    end
  end
end
