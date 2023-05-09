import 'package:playing_cards/playing_cards.dart';

///
/// 52-card deck structure
///
/// The Suits are Club (♣), Diamond (♦), Heart (♥), and Spade (♠)
///
sealed class SuitModel {
  const SuitModel();
  String get symbol;
  String get color;

  @override
  String toString() => symbol;
}

class Clubs extends SuitModel {
  const Clubs();

  @override
  String get symbol => "♣";

  @override
  String get color => "black";
}

class Diamonds extends SuitModel {
  const Diamonds();

  @override
  String get symbol => "♦";

  @override
  String get color => "red";
}

class Hearts extends SuitModel {
  const Hearts();

  @override
  String get symbol => "♥";

  @override
  String get color => "red";
}

class Spades extends SuitModel {
  const Spades();

  @override
  String get symbol => "♠";

  @override
  String get color => "black";
}

///
/// From Model to Suit
///
Suit getSuit(SuitModel suitModel) {
  switch (suitModel.runtimeType) {
    case Spades:
      return Suit.spades;
    case Hearts:
      return Suit.hearts;
    case Diamonds:
      return Suit.diamonds;
    case Clubs:
     return Suit.clubs;
    default:
      throw ArgumentError("Invalid suit type");
  }
}
