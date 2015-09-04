class Player < ActiveRecord::Base
  belongs_to :round
  has_many :response_cards
end
