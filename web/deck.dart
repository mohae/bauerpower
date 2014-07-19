part of bauer_power;

class Deck {
  static const num CARD_CNT = 24;
  static const num SUIT_CNT = 4;
  static const num CARDS_PER_SUIT = CARD_CNT ~/ NUM_SUIT_CNT;

  final List<Card> _cards = new List<Card>(NUM_CARDS);

  Deck() {
    _getDeck();
  }

  void _getDeck() {
    var count = 0;
    // Start suit index at 1
    for (var suit = 1; suit <= NUM_SUITS; ++ suit) {
      //Euchre decks go from 9 to Aces, or 9 to 14, inclusive.
      for (var number = 9; number <= 14; ++ number) {
        _cards[count ++] = new Card(suit, number);
      }
    }
  }

  List<Card> get cards => _cards;

 /// shuffle implements the Fisher-Yates shuffle. 
  void shuffle() {
    var random = new math.Random(seed);

    for (var i = _cards.length - 1; i > 0; i--) {
      _swapCards(i, random.nextInt(_cards.length));
    }
  }

  void _swapCards(int i, int j) {
    var tmp = _cards[i];
    _cards[i] = _cards[j];
    _cards[j] = tmp;
  }
}
