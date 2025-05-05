//
//  Generated code. Do not modify.
//  source: api_dto/fetch_user.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use fetchUserRequestDescriptor instead')
const FetchUserRequest$json = {
  '1': 'FetchUserRequest',
};

/// Descriptor for `FetchUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchUserRequestDescriptor = $convert.base64Decode(
    'ChBGZXRjaFVzZXJSZXF1ZXN0');

@$core.Deprecated('Use fetchUserResultDescriptor instead')
const FetchUserResult$json = {
  '1': 'FetchUserResult',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `FetchUserResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fetchUserResultDescriptor = $convert.base64Decode(
    'Cg9GZXRjaFVzZXJSZXN1bHQSFwoHdXNlcl9pZBgBIAEoCVIGdXNlcklk');

