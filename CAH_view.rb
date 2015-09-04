class CardGame

  def greeting
    clear_screen
    puts "\n Welcome to Cards Against Humanity phase 1 edition!"
    user_input
  end

  def ask_input
    gets.chomp
  end

  def clear_screen
    print "\e[H"
    print "\e2J"
  end

  def display_card(card)
    puts card
  end

  def display_hand(cards)
    cards.each_with_index{|card, index| puts "#{index +1}. #{card}\n"}
  end

  def results(prompt, card, comp_card)
    puts "#{prompt}\n Your play: #{card}\n Computer play: #{comp_card}"
  end

  def

  def closing
    puts "Stay classy!"
  end


end
