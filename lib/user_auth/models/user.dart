class User {
  const User(
    this.id,
    this.username,
    this.email,
    this.oAuthId,
    // this.phone,
    this.oAuthPlatform,
    this.createdAt,
  );

  final int id; // 유저 고유 id
  final String username; // 유저 이름 / 닉네임
  final String email; // 이메일
  final String oAuthId; // sns 플랫폼 연동 id
  // final String phone; // 연락처
  final String oAuthPlatform; // 로그인한 sns 플랫폼
  final DateTime createdAt; // 가입일
}
