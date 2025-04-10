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

  final int id;
  final int userId;
  final String name;
  final String introduction;
  final String profileImageUrl;
  // final PetType type;
  // final bool isMale;
}
