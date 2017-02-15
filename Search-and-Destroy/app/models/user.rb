class User < ApplicationRecord
  has_many :games_users
  has_many :games, through: :games_users
  has_many :games_won, foreign_key: :winner_id ,class_name: 'Game'

end
