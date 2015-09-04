class Model
  attr_reader :prompt_cards, :response_cards, :used_cards, :hand

  def initialize(cards = {})

    @prompt_cards = cards[:prompt_cards]
    @response_cards = cards[:response_cards]
    @hand = []

  end

  def draw_prompt_card
    prompt_cards.sample
  end

  def draw_hand
    i = 0
    while i <= 5 do
      hand << response_cards[i]
      i++
    end
    hand
  end

  def unused_cards
    response_cards - hand
  end

  def computer_choice
    unused_cards.sample
  end


end

prompt_file = CardMaker.make_cards('db/data/prompt_cards.txt')
response_file = CardMaker.make_cards('db/data/response_cards.txt')
Model.new(prompt_file,response_file)
