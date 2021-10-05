///
//  Generated code. Do not modify.
//  source: server/src/main/proto/movie-service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class MovieItem extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MovieItem', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'moviecatalog'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..a<$core.double>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'price', $pb.PbFieldType.OD)
    ..aOB(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'inStock', protoName: 'inStock')
    ..hasRequiredFields = false
  ;

  MovieItem._() : super();
  factory MovieItem({
    $core.String? name,
    $core.double? price,
    $core.bool? inStock,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (price != null) {
      _result.price = price;
    }
    if (inStock != null) {
      _result.inStock = inStock;
    }
    return _result;
  }
  factory MovieItem.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MovieItem.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MovieItem clone() => MovieItem()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MovieItem copyWith(void Function(MovieItem) updates) => super.copyWith((message) => updates(message as MovieItem)) as MovieItem; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MovieItem create() => MovieItem._();
  MovieItem createEmptyInstance() => create();
  static $pb.PbList<MovieItem> createRepeated() => $pb.PbList<MovieItem>();
  @$core.pragma('dart2js:noInline')
  static MovieItem getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MovieItem>(create);
  static MovieItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get price => $_getN(1);
  @$pb.TagNumber(2)
  set price($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPrice() => $_has(1);
  @$pb.TagNumber(2)
  void clearPrice() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get inStock => $_getBF(2);
  @$pb.TagNumber(3)
  set inStock($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasInStock() => $_has(2);
  @$pb.TagNumber(3)
  void clearInStock() => clearField(3);
}

class AddMovieResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AddMovieResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'moviecatalog'), createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'wasSaved', protoName: 'wasSaved')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'itemId', $pb.PbFieldType.O3, protoName: 'itemId')
    ..hasRequiredFields = false
  ;

  AddMovieResponse._() : super();
  factory AddMovieResponse({
    $core.bool? wasSaved,
    $core.int? itemId,
  }) {
    final _result = create();
    if (wasSaved != null) {
      _result.wasSaved = wasSaved;
    }
    if (itemId != null) {
      _result.itemId = itemId;
    }
    return _result;
  }
  factory AddMovieResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddMovieResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddMovieResponse clone() => AddMovieResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddMovieResponse copyWith(void Function(AddMovieResponse) updates) => super.copyWith((message) => updates(message as AddMovieResponse)) as AddMovieResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AddMovieResponse create() => AddMovieResponse._();
  AddMovieResponse createEmptyInstance() => create();
  static $pb.PbList<AddMovieResponse> createRepeated() => $pb.PbList<AddMovieResponse>();
  @$core.pragma('dart2js:noInline')
  static AddMovieResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddMovieResponse>(create);
  static AddMovieResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get wasSaved => $_getBF(0);
  @$pb.TagNumber(1)
  set wasSaved($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasWasSaved() => $_has(0);
  @$pb.TagNumber(1)
  void clearWasSaved() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get itemId => $_getIZ(1);
  @$pb.TagNumber(2)
  set itemId($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasItemId() => $_has(1);
  @$pb.TagNumber(2)
  void clearItemId() => clearField(2);
}

class FetchMovieRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FetchMovieRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'moviecatalog'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..hasRequiredFields = false
  ;

  FetchMovieRequest._() : super();
  factory FetchMovieRequest({
    $core.String? name,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory FetchMovieRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchMovieRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchMovieRequest clone() => FetchMovieRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchMovieRequest copyWith(void Function(FetchMovieRequest) updates) => super.copyWith((message) => updates(message as FetchMovieRequest)) as FetchMovieRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchMovieRequest create() => FetchMovieRequest._();
  FetchMovieRequest createEmptyInstance() => create();
  static $pb.PbList<FetchMovieRequest> createRepeated() => $pb.PbList<FetchMovieRequest>();
  @$core.pragma('dart2js:noInline')
  static FetchMovieRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchMovieRequest>(create);
  static FetchMovieRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);
}

