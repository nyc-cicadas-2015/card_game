# require_relative 'lib/card_importer'

class Model
  attr_reader :prompt_cards, :response_cards, :used_cards, :hand, :computer_hand

  def initialize(prompt_cards,response_cards)
    @prompt_cards = prompt_cards
    @response_cards = response_cards
    @hand = []
    @computer_hand = []
  end

  def draw_prompt_card
    prompt_cards.sample
  end

  def draw_hand
    response_cards.shuffle.take(5)
    # i = 0
    # while i < 5
    #   hand << response_cards[i]
    #   i+=1
    #   # break
    # end
    # hand
  end

  def unused_cards
    response_cards - hand
  end

  def computer_choice
    5.times {
      computer_hand << unused_cards.sample
    }
    computer_hand
  end


end

# prompt_file = CardMaker.make_cards('db/data/prompt_cards.txt')
# response_file = CardMaker.make_cards('db/data/response_cards.txt')
# model = Model.new(prompt_file,response_file)
