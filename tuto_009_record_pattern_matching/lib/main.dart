import 'package:flutter/material.dart';
import 'package:playing_cards/playing_cards.dart';
import 'models/deck_model.dart';

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
      home: CardsPage(title: '52 Card Deck'),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      body: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverGrid.count(
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 10,
              children: <Widget>[
                for (var cardToDisplay in getPlayingCardView()) cardToDisplay,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
