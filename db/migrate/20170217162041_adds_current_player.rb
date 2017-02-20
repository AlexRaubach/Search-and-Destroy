class AddsCurrentPlayer < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :current_player_id, :integer
  end
end
