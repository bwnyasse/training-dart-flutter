import 'package:flutter/material.dart';
import 'package:playing_cards/playing_cards.dart';
import 'models/deck_model.dart';
import 'package:flip_card/flip_card.dart';

import 'models/suit_model.dart';

const TextStyle kTitleTextStyle = TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '52 Card Deck',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const CardsPage(title: '52 Card Deck'),
    );
  }
}

class CardsPage extends StatefulWidget {
  const CardsPage({super.key, required this.title});

  final String title;

  @override
  State<CardsPage> createState() => _CardsPageState();
}

class _CardsPageState extends State<CardsPage> {
  List<FlipCard> deckCards = [];

  @override
  void initState() {
    deckCards = deckModel
        .map((record) => getFlipCard(PlayingCardView(
            card: PlayingCard(getSuit(record.$1), record.$2.value))))
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Center(
          child: Wrap(
            spacing: 9.0,
            children: [
              Icon(
                Icons.style,
                color: Colors.redAccent[700],
              ),
              Text(widget.title, style: kTitleTextStyle)
            ],
          ),
        ),
      ),
      body: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverGrid.count(
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 5,
              children: <Widget>[
                for (var cardToDisplay in deckCards) cardToDisplay,
              ],
            ),
          ),
        ],
      ),
    );
  }
}

FlipCard getFlipCard(PlayingCardView view) {
  return FlipCard(
    fill: Fill
        .fillBack, // Fill the back side of the card to make in the same size as the front.
    direction: FlipDirection.HORIZONTAL, // default
    side: CardSide.FRONT, // The side to initially display.
    front: view,
    back: Image.asset('assets/back.jpeg'),
  );
}
