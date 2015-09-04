require_relative 'CAH_model'
require_relative 'CAH_view'
require_relative 'lib/card_importer'

class Controller
  attr_reader :model, :view

  def initialize(model,view)
    @model = model
    @view = view
  end

  def run
    view.greeting
    prompt_card = model.draw_prompt_card
    view.display_card(prompt_card)
    hand = model.draw_hand
    view.display_hand(hand)
    # view.ask_input
    user_choice = view.ask_input
    view.clear_screen
    view.results(prompt_card, user_choice, model.computer_hand)
    view.display_card(model.draw_hand[user_choice.to_i - 1])
    view.play_again
    user_answer = view.ask_input
    if user_answer.downcase == "yes"
      self.run
    else
      view.closing
    end

  end

end

prompt_file = CardMaker.make_cards('db/data/prompt_cards.txt')
response_file = CardMaker.make_cards('db/data/response_cards.txt')
model = Model.new(prompt_file,response_file)
view = CardGame.new
game = Controller.new(model, view)
game.run
