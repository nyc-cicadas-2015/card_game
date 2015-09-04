require_relative 'model'
require_relative 'view'

class Controller
  attr_reader :model, :view

  def initialize(args = {})

    @model = args[:model]
    @view = args[:view]

  end

  def run

    view.greeting
    prompt_card = model.draw_prompt_card
    view.display_card(prompt_card)
    hand = model.draw_hand
    view.display_hand(hand)
    view.ask_input
    user_choice = view.ask_input
    view.clear_screen
    view.results(prompt_card, user_choice, computer_choice)

    view.display_card(model.draw_hand[user_choice - 1])
    view.play_again
    user_answer = view.ask_input
    if user_answer == "yes"
      self.run
    else
      view.closing
    end


  end

end
