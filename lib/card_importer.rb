
module CardMaker

  def self.make_cards(file)
    cards = []
    File.open(file).readlines.each do |line|
      cards << line.chomp
    end
    cards
  end
end
