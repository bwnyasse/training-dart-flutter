///
//  Generated code. Do not modify.
//  source: server/src/main/proto/movie-service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use movieItemDescriptor instead')
const MovieItem$json = const {
  '1': 'MovieItem',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'price', '3': 2, '4': 1, '5': 1, '10': 'price'},
    const {'1': 'inStock', '3': 3, '4': 1, '5': 8, '10': 'inStock'},
  ],
};

/// Descriptor for `MovieItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List movieItemDescriptor = $convert.base64Decode('CglNb3ZpZUl0ZW0SEgoEbmFtZRgBIAEoCVIEbmFtZRIUCgVwcmljZRgCIAEoAVIFcHJpY2USGAoHaW5TdG9jaxgDIAEoCFIHaW5TdG9jaw==');
@$core.Deprecated('Use addMovieResponseDescriptor instead')
const AddMovieResponse$json = const {
  '1': 'AddMovieResponse',
  '2': const [
    const {'1': 'wasSaved', '3': 1, '4': 1, '5': 8, '10': 'wasSaved'},
    const {'1': 'itemId', '3': 2, '4': 1, '5': 5, '10': 'itemId'},
  ],
};

/// Descriptor for `AddMovieResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addMovieResponseDescriptor = $convert.base64Decode('ChBBZGRNb3ZpZVJlc3BvbnNlEhoKCHdhc1NhdmVkGAEgASgIUgh3YXNTYXZlZBIWCgZpdGVtSWQYAiABKAVSBml0ZW1JZA==');
@$core.Deprecated('Use fetchMovieRequestDescriptor instead')
const FetchMovieRequest$json = const {
  '1': 'FetchMovieRequest',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `FetchMovieRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchMovieRequestDescriptor = $convert.base64Decode('ChFGZXRjaE1vdmllUmVxdWVzdBISCgRuYW1lGAEgASgJUgRuYW1l');
