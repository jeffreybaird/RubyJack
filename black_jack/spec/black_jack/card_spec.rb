require 'black_jack/card'

module BlackJack
	describe Card do
		before do
			@card = Card.new("King","hearts")
		end
		it "Has a value" do
	      @card.value.should == "King"
		end
		it "Has a suit" do
	      @card.suit.should == "hearts"
		end
		it "Describes the card" do
		  @card.description.should == "King of hearts"
		end
		it "Returns a Value" do
		  @card.card_value.should == 10
	    end
    end
end
