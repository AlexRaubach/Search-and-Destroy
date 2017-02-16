class Game < ApplicationRecord

  belongs_to :winner, class_name: 'User', optional: true
  has_many :boards
  has_many :users, through: :boards

end
