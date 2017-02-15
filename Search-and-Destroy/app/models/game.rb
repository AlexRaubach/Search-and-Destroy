class Game < ApplicationRecord
  belongs_to :winner, class_name: 'User'
  has_many :games_users
  has_many :users, through: :games_users
end
