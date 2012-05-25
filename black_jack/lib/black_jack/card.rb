class Card
  attr_reader :value, :suit

  def initialize(value, suit)
    @value = value
    @suit  = suit
  end

  def ==(card)
    @value == card.value && @suit == card.suit
  end

  def description
    "#{@value} of #{@suit}"
  end

  def card_value
    case @value
      when "Queen", "King", "Jack"
        10
      when "Ace"
        11
      when /[2-9]|10/
        @value.to_i
      else
        0
    end
  end
end