// TODO: 추후에 대댓글 및 댓글에 좋아요 기능 추가 고려 (1차는 그냥 댓글만)
// TODO: 작성자 정보 (이름&프로필 이미지 url 등) 필요함
// TODO: 내가 작성한 글인지 여부 추가

class CommentDetail {
  /// 댓글 정보
  const CommentDetail(this.id, this.username, this.createdAt, this.text);

  // 댓글 고유 id
  final int id;

  /// 작성자 아이디
  final String username;

  /// 작성 일시
  final DateTime createdAt;

  /// 댓글 내용
  final String text;
}
