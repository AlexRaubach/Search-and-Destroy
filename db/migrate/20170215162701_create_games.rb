class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.integer :winner_id

      t.timestamps
    end
  end
end
