import 'package:grpc/grpc.dart';
import 'package:sample_dart_grpc_client/generated/server/src/main/proto/movie-service.pbgrpc.dart';

Future<void> main(List<String> args) async {
  final channel = ClientChannel(
    'localhost',
    port: 9090,
    options: ChannelOptions(
      credentials: ChannelCredentials.insecure(),
    ),
  );
  final stub = MovieCatalogClient(channel);

  //Create a movie
  MovieItem terminator2 = MovieItem()
    ..name = 'Terminator 2'
    ..price = 20.95
    ..inStock = true;

  print('Saving movie:  $terminator2');
  final addMovieResponse = await stub.saveNewMovie(terminator2);
  print('Response is => :  $addMovieResponse');

  final fetchMovieRequest = FetchMovieRequest()..name = 'The Lion King';
  print('Fetching movie:  $fetchMovieRequest');
  final movieItem = await stub.fetchExistingMovie(fetchMovieRequest);
  print('Response is => :  $movieItem');
  await channel.shutdown();
}
