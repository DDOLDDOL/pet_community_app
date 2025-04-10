class PostDetail {
  /// 게시글 정보
  const PostDetail(
    this.id,
    this.petname,
    this.petProfileImageUrl,
    this.imageUrls,
    this.content,
    this.likes,
    this.commentsCount,
  );

  /// post의 고유 id
  final int id;

  /// 유저 아이디
  final String petname;

  /// 유저 프로필 사진 이미지 url
  final String petProfileImageUrl;

  /// 게시한 이미지 url 리스트
  final List<String> imageUrls;

  /// 쓴 글
  final String content;

  /// 좋야요 수
  final int likes; // 좋아요를 누른 유저는 좋아요 상세 창을 누르면 불러옵니다

  /// 댓글 수
  final int commentsCount; // 댓글 리스트는 댓글 창을 열면 불러옵니다
}
