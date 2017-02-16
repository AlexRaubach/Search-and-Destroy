class User < ApplicationRecord
  has_many :boards
  has_many :games, through: :boards
  has_many :games_won, foreign_key: :winner_id ,class_name: 'Game'

end
