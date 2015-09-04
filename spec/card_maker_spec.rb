require 'rspec'
require_relative('../lib/card_importer')


describe CardMaker do
  let(:file){File.expand_path('../../db/data/response_cards.txt', __FILE__)}
  let(:tasks){CardMaker.make_cards(file)}

  describe "#get_tasks_from_file" do
    it "should return an array of cards" do
      expect(tasks.size).to eq(538)
    end
  end
end
