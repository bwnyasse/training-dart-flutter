import 'package:playing_cards/playing_cards.dart';

///
///  52-card deck structure
///
/// The cards Rank go from 1 (also called Ace) up to 10, Jack (11), Queen (12), and King (13)
///
sealed class RankModel {
  const RankModel();
  CardValue get value;
}

class Ace extends RankModel {
  const Ace();
  @override
  CardValue get value => CardValue.ace;
}

class Two extends RankModel {
  const Two();
  @override
  CardValue get value => CardValue.two;
}

class Three extends RankModel {
  const Three();
  @override
  CardValue get value => CardValue.three;
}

class Four extends RankModel {
  const Four();
  @override
  CardValue get value => CardValue.four;
}

class Five extends RankModel {
  const Five();
  @override
  CardValue get value => CardValue.five;
}

class Six extends RankModel {
  const Six();
  @override
  CardValue get value => CardValue.six;
}

class Seven extends RankModel {
  const Seven();
  @override
  CardValue get value => CardValue.seven;
}

class Eight extends RankModel {
  const Eight();
  @override
  CardValue get value => CardValue.eight;
}

class Nine extends RankModel {
  const Nine();
  @override
  CardValue get value => CardValue.nine;
}

class Ten extends RankModel {
  const Ten();
  @override
  CardValue get value => CardValue.ten;
}

class Jack extends RankModel {
  const Jack();
  @override
  CardValue get value => CardValue.jack;
}

class Queen extends RankModel {
  const Queen();
  @override
  CardValue get value => CardValue.queen;
}

class King extends RankModel {
  const King();
  @override
  CardValue get value => CardValue.king;
}
