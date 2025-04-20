class PetDetail {
  const PetDetail(
    this.id,
    this.userId,
    this.name,
    this.introduction,
    this.profileImageUrl,
  //   this.type, {
  //   required this.isMale,
  // }
  );

  /// 반려동물의 id입니다
  final int id;

  /// 주인 유저 id입니다
  final int userId;

  /// 반려동물 이름입니다
  final String name;

  /// 소개글입니다
  final String introduction;

  /// 프로필 이미지 url입니다
  final String profileImageUrl;
  // final PetType type;
  // final bool isMale;
}
