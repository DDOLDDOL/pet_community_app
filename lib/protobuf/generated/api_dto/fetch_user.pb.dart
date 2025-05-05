//
//  Generated code. Do not modify.
//  source: api_dto/fetch_user.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class FetchUserRequest extends $pb.GeneratedMessage {
  factory FetchUserRequest() => create();
  FetchUserRequest._() : super();
  factory FetchUserRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchUserRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FetchUserRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'api_dto'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchUserRequest clone() => FetchUserRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchUserRequest copyWith(void Function(FetchUserRequest) updates) => super.copyWith((message) => updates(message as FetchUserRequest)) as FetchUserRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FetchUserRequest create() => FetchUserRequest._();
  FetchUserRequest createEmptyInstance() => create();
  static $pb.PbList<FetchUserRequest> createRepeated() => $pb.PbList<FetchUserRequest>();
  @$core.pragma('dart2js:noInline')
  static FetchUserRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchUserRequest>(create);
  static FetchUserRequest? _defaultInstance;
}

class FetchUserResult extends $pb.GeneratedMessage {
  factory FetchUserResult({
    $core.String? userId,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    return $result;
  }
  FetchUserResult._() : super();
  factory FetchUserResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchUserResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FetchUserResult', package: const $pb.PackageName(_omitMessageNames ? '' : 'api_dto'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchUserResult clone() => FetchUserResult()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchUserResult copyWith(void Function(FetchUserResult) updates) => super.copyWith((message) => updates(message as FetchUserResult)) as FetchUserResult;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FetchUserResult create() => FetchUserResult._();
  FetchUserResult createEmptyInstance() => create();
  static $pb.PbList<FetchUserResult> createRepeated() => $pb.PbList<FetchUserResult>();
  @$core.pragma('dart2js:noInline')
  static FetchUserResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchUserResult>(create);
  static FetchUserResult? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
