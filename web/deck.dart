part of bauer_power;

class Deck {
  static const num CARD_CNT = 24;
  static const num SUIT_CNT = 4;
  static const num CARDS_PER_SUIT = CARD_CNT ~/ NUM_SUIT_CNT;

  final List<Card> _cards = new List<Card>(NUM_CARDS);

  Deck() {
    _populateCards();
  }

  void _populateCards() {
    var pivot = 0;
    for (var suit = 0; suit < NUM_SUITS; ++ suit) {
      var color = suit % 2;
      for (var number = 1; number <= NUM_CARDS_BY_SUIT; ++ number) {
        _cards[pivot ++] = new Card(suit, number, color);
      }
    }
  }

  List<Card> get cards => _cards;

  void shuffle(int seed) {
    var random = new math.Random(seed);

    for (var i = 0; i < _cards.length; ++ i) {
      _swapCards(i, random.nextInt(_cards.length));
    }
  }

  void _swapCards(int i, int j) {
    var tmp = _cards[i];
    _cards[i] = _cards[j];
    _cards[j] = tmp;
  }
}
