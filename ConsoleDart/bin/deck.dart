void main(){
  var deck = new Deck();
  deck.cards.shuffle();
  //print(deck.toString());
  //print(deck.cardWithSuit('Diamonds').toString());
  //print(deck.deal(5));
  //print(deck);

  deck.removeCard('Diamonds', 'Ace');
  print(deck);
}

class Deck{
  List<Card> cards = new List<Card>();

  Deck(){
    var suits = ['Diamonds', 'Hearts', 'Clubs', 'Spades'];
    var ranks = ['Ace', 'Two', 'Three', 'Four', 'Five'];

    for(var suit in suits){
      for(var rank in ranks){
        var card = new Card(
            rank: rank,
            suit: suit
        );
        cards.add(card);
      }
    }
  }

  toString(){
    return cards.toString();
  }

  shuffle(){
    cards.shuffle();
  }

  cardWithSuit(var suit){
    return cards.where((card) => card.suit == suit);
  }

  deal(int handSize){
    var hand = cards.sublist(0, handSize);
    cards = cards.sublist(handSize);
    return hand;
  }

  removeCard(String suit, String rank){
    cards.removeWhere((card) => card.suit == suit && card.rank == rank);
  }
}

class Card {
  String suit;
  String rank;

  Card({this.suit, this.rank});

  toString(){
    return '$rank of $suit';
  }
}
