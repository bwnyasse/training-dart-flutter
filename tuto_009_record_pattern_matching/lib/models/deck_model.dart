import 'dart:math';

import 'package:flip_card/flip_card.dart' as flip_card;
import 'package:flutter/material.dart';
import 'package:playing_cards/playing_cards.dart';

import 'card_model.dart';
import 'rank_model.dart';
import 'suit_model.dart';

///
///  52-card deck structure
///
const List<CardModel> _deck = [
  // Clubs

  (Clubs(), Ace()),
  (Clubs(), Two()),
  (Clubs(), Three()),
  (Clubs(), Four()),
  (Clubs(), Five()),
  (Clubs(), Six()),
  (Clubs(), Seven()),
  (Clubs(), Eight()),
  (Clubs(), Nine()),
  (Clubs(), Ten()),
  (Clubs(), Jack()),
  (Clubs(), Queen()),
  (Clubs(), King()),

  // Diamonds
  (Diamonds(), Ace()),
  (Diamonds(), Two()),
  (Diamonds(), Three()),
  (Diamonds(), Four()),
  (Diamonds(), Five()),
  (Diamonds(), Six()),
  (Diamonds(), Seven()),
  (Diamonds(), Eight()),
  (Diamonds(), Nine()),
  (Diamonds(), Ten()),
  (Diamonds(), Jack()),
  (Diamonds(), Queen()),
  (Diamonds(), King()),

  // Hearts
  (Hearts(), Ace()),
  (Hearts(), Two()),
  (Hearts(), Three()),
  (Hearts(), Four()),
  (Hearts(), Five()),
  (Hearts(), Six()),
  (Hearts(), Seven()),
  (Hearts(), Eight()),
  (Hearts(), Nine()),
  (Hearts(), Ten()),
  (Hearts(), Jack()),
  (Hearts(), Queen()),
  (Hearts(), King()),

  // Spades
  (Spades(), Ace()),
  (Spades(), Two()),
  (Spades(), Three()),
  (Spades(), Four()),
  (Spades(), Five()),
  (Spades(), Six()),
  (Spades(), Seven()),
  (Spades(), Eight()),
  (Spades(), Nine()),
  (Spades(), Ten()),
  (Spades(), Jack()),
  (Spades(), Queen()),
  (Spades(), King()),
];

class Deck {
  final List<CardModel> cards;
  const Deck._(this.cards);

  factory Deck.init() => const Deck._(_deck);

  (CardModel, Deck) get pickCard {
    final cardIndex = Random().nextInt(cards.length);
    return (
      cards[cardIndex],
      // remove the picked card from the deck
      Deck._([
        ...cards.sublist(0, cardIndex),
        ...cards.sublist(cardIndex + 1),
      ])
    );
  }

  Deck get shuffle {
    List<CardModel> source = [...cards];
    for (int i = source.length - 1; i > 0; i--) {
      final j = (Random().nextDouble() * (i + 1)).floor();
      final sourceI = source[i];
      source[i] = source[j];
      source[j] = sourceI;
    }

    return Deck._(source);
  }

  bool get isEmpty => cards.isEmpty;

  @override
  String toString() => cards.join("\n");
}

List<flip_card.FlipCard> loadPlayingCardView() {
  Deck deck = Deck.init().shuffle;
  return deck.cards
      .map((record) => getFlipCard(PlayingCardView(
          card: PlayingCard(getSuit(record.$1), record.$2.value))))
      .toList();
}

flip_card.FlipCard getFlipCard(PlayingCardView view) {
  return flip_card.FlipCard(
    fill: flip_card.Fill
        .fillBack, // Fill the back side of the card to make in the same size as the front.
    direction: flip_card.FlipDirection.HORIZONTAL, // default
    side: flip_card.CardSide.FRONT, // The side to initially display.
    front: view,
    back: Image.asset('assets/back.jpeg'),
  );
}
