import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
// import 'package:gnc_sangvo_app/api/api.dart';
// import 'package:gnc_sangvo_app/auth/auth.dart';

import '../../common/common.dart';

class AuthRepository {
  // AuthRepository({
  //   required TokenHive tokenHive,
  //   required ApiClient apiClient,
  //   required OAuthClient oAuthClient,
  // })  : _tokenHive = tokenHive,
  //       _apiClient = apiClient,
  //       _oAuthClient = oAuthClient,
  //       _userStreamController = StreamController.broadcast();

  // final TokenHive _tokenHive;
  // final ApiClient _apiClient;
  // final OAuthClient _oAuthClient;
  // late final StreamController<User> _userStreamController;

  // /// login 요청입니다.
  // ///
  // /// 계정 ID와 비밀번호를 인증하고 jwt token을 받아 [TokenHive]에 저장합니다.
  // Future<void> login(String accountId, String password) async {
  //   if (accountId.isEmpty) {
  //     throw const ApiException.apiError(400, message: '아이디를 입력해주세요');
  //   }

  //   if (password.isEmpty) {
  //     throw const ApiException.apiError(400, message: '비밀번호를 입력해주세요');
  //   }

  //   // 아이디, 비밀번호 일치 시 jwt 토큰 발급
  //   final response = await _apiClient.post(
  //     '/api/login/',
  //     body: {
  //       "username": accountId,
  //       "password": password,
  //     },
  //   );

  //   if (response.hasException) throw response.exception!;

  //   final accessToken = response.data?['jwt_token']['access_token'] as String?;
  //   final encryptedRefreshToken =
  //       response.data?['jwt_token']['encrypt_refresh_token_id'] as String?;

  //   if (accessToken == null || encryptedRefreshToken == null) {
  //     throw Exception('로그인 정보를 불러오는 데 실패했습니다');
  //   }

  //   await _tokenHive.setTokens(accessToken, encryptedRefreshToken);
  // }

  // /// [checkAccountDuplicated]의 결과로 가입되어 있는 계정의 Authentication을 요청합니다
  // Future<void> loginOAuthUser(OAuthResult result) async {
  //   final response = await _apiClient.post(
  //     '/api/oauth/login/',
  //     body: {
  //       "email": result.email,
  //       "oauth_type": result.platform,
  //       "oauth_token": result.accessToken,
  //     },
  //   );

  //   if (response.hasException) throw response.exception!;

  //   final accessToken = response.data?['jwt_token']['access_token'] as String?;
  //   final encryptedRefreshToken =
  //       response.data?['jwt_token']['encrypt_refresh_token_id'] as String?;

  //   if (accessToken == null || encryptedRefreshToken == null) {
  //     throw Exception('Failed to authenticate user');
  //   }

  //   await _tokenHive.setTokens(accessToken, encryptedRefreshToken);
  // }

  // /// logout 요청입니다.
  // ///
  // /// refresh token을 revoke 하는 요청을 보내고 [TokenHive]를 초기화합니다.
  // Future<void> logout({
  //   OAuthPlatform? platform,
  // }) async {
  //   _revokeRefreshToken();

  //   _userStreamController.sink.add(User.unknown());
  //   await _tokenHive.init();

  //   if (platform == null) return;
  //   _oAuthClient.logout();
  // }

  // Future<void> requestOAuth(OAuthPlatform platform) =>
  //     _oAuthClient.login(platform);

  // /// 유저 정보를 불러옵니다.
  // ///
  // /// [TokenHive]가 비어있으면 unknown user를, 그렇지 않으면 user fetch 요청을 보냅니다.
  // /// [User] 결과 값은 [watchUser] stream을 통해 broadcast 됩니다.
  // Future<void> fetchUser() async {
  //   // 앱을 켰을 때도 한 번 실행되므로, token hive가 비어있으면 (로그아웃 상태일 시)에는 [User.unknown]을 반환합니다
  //   if (_tokenHive.encryptedRefreshToken == null) {
  //     return _userStreamController.sink.add(User.unknown());
  //   }

  //   final response = await _apiClient.get('/api/user-info/', needAuth: true);
  //   if (response.hasException) throw response.exception!;

  //   _userStreamController.sink.add(User.fromJson(response.data!));
  // }

  // /// [fetchUser] 결과로 나온 [User] 값을 broadcast 해주는 stream입니다
  // Stream<User> watchUser() => _userStreamController.stream;

  // /// [firebase_auth.User] 값을 broadcast 해주는 stream입니다
  // // Stream<firebase_auth.User?> watchFirebaseAuthUser() =>
  // //     _oAuthClient.watchUser();

  // Stream<OAuthResult> watchOAuthResult() => _oAuthClient.watchOAuthResult();

  // void closeUserStream() => _userStreamController.close();

  // Future<void> _revokeRefreshToken() async {
  //   // TokenHive를 초기화 시킨 후에 호출하므로, 동기화 후 exception handling 할 필요가 없어서
  //   // 예외 발생 시 repository에서 로그만 찍습니다
  //   try {
  //     final encryptedRefreshToken = _tokenHive.encryptedRefreshToken;
  //     if (encryptedRefreshToken == null) return;

  //     final response = await _apiClient.post(
  //       '/api/logout/',
  //       needAuth: true,
  //       body: {
  //         'encrypt_refresh_token_id': encryptedRefreshToken,
  //       },
  //     );

  //     if (response.hasException) throw response.exception!;
  //   } on ApiException catch (error) {
  //     log('Refresh token revoking error: $error');
  //   } on Exception catch (error) {
  //     log('Refresh token revoking error: $error');
  //   }
  // }
}
