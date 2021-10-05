///
//  Generated code. Do not modify.
//  source: server/src/main/proto/movie-service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'movie-service.pb.dart' as $0;
export 'movie-service.pb.dart';

class MovieCatalogClient extends $grpc.Client {
  static final _$saveNewMovie =
      $grpc.ClientMethod<$0.MovieItem, $0.AddMovieResponse>(
          '/moviecatalog.MovieCatalog/SaveNewMovie',
          ($0.MovieItem value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.AddMovieResponse.fromBuffer(value));
  static final _$fetchExistingMovie =
      $grpc.ClientMethod<$0.FetchMovieRequest, $0.MovieItem>(
          '/moviecatalog.MovieCatalog/FetchExistingMovie',
          ($0.FetchMovieRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.MovieItem.fromBuffer(value));

  MovieCatalogClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.AddMovieResponse> saveNewMovie($0.MovieItem request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$saveNewMovie, request, options: options);
  }

  $grpc.ResponseFuture<$0.MovieItem> fetchExistingMovie(
      $0.FetchMovieRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$fetchExistingMovie, request, options: options);
  }
}

abstract class MovieCatalogServiceBase extends $grpc.Service {
  $core.String get $name => 'moviecatalog.MovieCatalog';

  MovieCatalogServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.MovieItem, $0.AddMovieResponse>(
        'SaveNewMovie',
        saveNewMovie_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.MovieItem.fromBuffer(value),
        ($0.AddMovieResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FetchMovieRequest, $0.MovieItem>(
        'FetchExistingMovie',
        fetchExistingMovie_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.FetchMovieRequest.fromBuffer(value),
        ($0.MovieItem value) => value.writeToBuffer()));
  }

  $async.Future<$0.AddMovieResponse> saveNewMovie_Pre(
      $grpc.ServiceCall call, $async.Future<$0.MovieItem> request) async {
    return saveNewMovie(call, await request);
  }

  $async.Future<$0.MovieItem> fetchExistingMovie_Pre($grpc.ServiceCall call,
      $async.Future<$0.FetchMovieRequest> request) async {
    return fetchExistingMovie(call, await request);
  }

  $async.Future<$0.AddMovieResponse> saveNewMovie(
      $grpc.ServiceCall call, $0.MovieItem request);
  $async.Future<$0.MovieItem> fetchExistingMovie(
      $grpc.ServiceCall call, $0.FetchMovieRequest request);
}
