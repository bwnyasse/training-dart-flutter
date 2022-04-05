import 'dart:ffi';
import 'dart:io';
import 'package:ffi/ffi.dart';

// C function - int get_max_of_players()
//
typedef MaxOfPlayersFunction = Int32 Function();
typedef MaxOfPlayersFunctionDart = int Function();

// C function - char *get_definition()
//
typedef DefinitionFunction = Pointer<Utf8> Function();
typedef DefinitionFunctionDart = Pointer<Utf8> Function();

// C function - char *get_best_player()
//
typedef BestPlayerFunction = Pointer<Utf8> Function();
typedef BestPlayerFunctionDart = Pointer<Utf8> Function();

// Handling  NbaFAQ C struct
class NbaFAQ extends Struct {
  @Double()
  external double get avg_temp_arena;
  external set avg_temp_arena(double value);

  @Int32()
  external int get time_quarters;
  external set time_quarters(int value);

  @Int32()
  external int get players_roster;
  external set players_roster(int value);

  @override
  String toString() => '''NBA Frequently Asked Questions:\n
  * average temp in arena :\n${avg_temp_arena.toStringAsFixed(1)}\n
  * How long are the quarters?  :\n ${time_quarters.toStringAsFixed(1)} minutes\n
  * How many players by roster? :\n ${players_roster.toStringAsFixed(1)} players\n
  ''';
}

typedef NbaFAQFunction = NbaFAQ Function(Uint8 useCelsius);
typedef NbaFAQFunctionDart = NbaFAQ Function(int useCelsius);

class FFIBridge {
  MaxOfPlayersFunctionDart _getMaxOfPlayers;
  DefinitionFunctionDart _getDefinition;
  BestPlayerFunctionDart _getBestPlayer;
  NbaFAQFunctionDart _getNbaFAQ;

  FFIBridge() {
    final dl = Platform.isAndroid ? DynamicLibrary.open('libnba.so') : DynamicLibrary.process();

    _getMaxOfPlayers = dl.lookupFunction<MaxOfPlayersFunction, MaxOfPlayersFunctionDart>('get_max_of_players');
    _getDefinition = dl.lookupFunction<DefinitionFunction, DefinitionFunctionDart>('get_definition');
    _getBestPlayer = dl.lookupFunction<BestPlayerFunction, BestPlayerFunctionDart>('get_best_player');
    _getNbaFAQ = dl.lookupFunction<NbaFAQFunction, NbaFAQFunctionDart>('get_nba_faq');
  }

  int getMaxOfPlayers() => _getMaxOfPlayers();

  String getDefinition() => _getDefinition().toDartString();

  String getBestPlayer() {
    final ptr = _getBestPlayer();
    final value = ptr.toDartString();
    calloc.free(ptr);
    return value;
  }

  NbaFAQ getNbaFAQ(bool useCelsius) {
    return _getNbaFAQ(useCelsius ? 1 : 0);
  }
}
