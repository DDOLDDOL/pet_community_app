import 'package:my_api_client/my_api_client.dart';
import 'package:pet_community_app/post/post.dart';

class PostRepository {
  const PostRepository(this._client);

  final ApiClient _client;

  Future<List<PostDetail>> fetchPostListByPetId(int petId) async {
    await Future.delayed(Duration(seconds: 1));

    return [
      PostDetail(
        1,
        '단비',
        'https://s3-alpha-sig.figma.com/img/2d11/02a3/a9d11b028beb92303cf9f243099d6e4e?Expires=1742169600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=kU6VzXV-XSvc58r2Yt12D7ILqQcaGfGdsLuBGo-T8PkjeZQFmVEgiGyIaLYh~N-0ha2WQYpgtl93yjMnzb4SxDyJ4h8TcTlC6ZVDw0L~GWVY1svWhJJBysoFCteDkJh1rHZhfadQuNjxDiGUnJTPU0vuGjVAAROFN8zh7nl1kVZ0LDt58tJ4Gh4BhgQoE1j7pafi6GX2ZYHlMqP5aKoX03G2DzeyweMg1kkxBe72MSXb5iOVrByI3tjWZLFSydjedgazh4XjpLt0OorZ9bh3HmjXwy-j6JezjJUixyhg4Y~99B2QF-Znue4pXJNCl6XONrHwJAsB9cKvpC~7X5WtNg__',
        [
          'https://s3-alpha-sig.figma.com/img/2d11/02a3/a9d11b028beb92303cf9f243099d6e4e?Expires=1742169600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=kU6VzXV-XSvc58r2Yt12D7ILqQcaGfGdsLuBGo-T8PkjeZQFmVEgiGyIaLYh~N-0ha2WQYpgtl93yjMnzb4SxDyJ4h8TcTlC6ZVDw0L~GWVY1svWhJJBysoFCteDkJh1rHZhfadQuNjxDiGUnJTPU0vuGjVAAROFN8zh7nl1kVZ0LDt58tJ4Gh4BhgQoE1j7pafi6GX2ZYHlMqP5aKoX03G2DzeyweMg1kkxBe72MSXb5iOVrByI3tjWZLFSydjedgazh4XjpLt0OorZ9bh3HmjXwy-j6JezjJUixyhg4Y~99B2QF-Znue4pXJNCl6XONrHwJAsB9cKvpC~7X5WtNg__',
          'https://s3-alpha-sig.figma.com/img/2d11/02a3/a9d11b028beb92303cf9f243099d6e4e?Expires=1742169600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=kU6VzXV-XSvc58r2Yt12D7ILqQcaGfGdsLuBGo-T8PkjeZQFmVEgiGyIaLYh~N-0ha2WQYpgtl93yjMnzb4SxDyJ4h8TcTlC6ZVDw0L~GWVY1svWhJJBysoFCteDkJh1rHZhfadQuNjxDiGUnJTPU0vuGjVAAROFN8zh7nl1kVZ0LDt58tJ4Gh4BhgQoE1j7pafi6GX2ZYHlMqP5aKoX03G2DzeyweMg1kkxBe72MSXb5iOVrByI3tjWZLFSydjedgazh4XjpLt0OorZ9bh3HmjXwy-j6JezjJUixyhg4Y~99B2QF-Znue4pXJNCl6XONrHwJAsB9cKvpC~7X5WtNg__',
        ],
        '오랜만에 새옷입고 주인이랑 친구만나러 가는 중..\n날씨 댕 좋다 ...',
        2400,
        120,
      ),
      PostDetail(
        2,
        '단비',
        'https://s3-alpha-sig.figma.com/img/2d11/02a3/a9d11b028beb92303cf9f243099d6e4e?Expires=1742169600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=kU6VzXV-XSvc58r2Yt12D7ILqQcaGfGdsLuBGo-T8PkjeZQFmVEgiGyIaLYh~N-0ha2WQYpgtl93yjMnzb4SxDyJ4h8TcTlC6ZVDw0L~GWVY1svWhJJBysoFCteDkJh1rHZhfadQuNjxDiGUnJTPU0vuGjVAAROFN8zh7nl1kVZ0LDt58tJ4Gh4BhgQoE1j7pafi6GX2ZYHlMqP5aKoX03G2DzeyweMg1kkxBe72MSXb5iOVrByI3tjWZLFSydjedgazh4XjpLt0OorZ9bh3HmjXwy-j6JezjJUixyhg4Y~99B2QF-Znue4pXJNCl6XONrHwJAsB9cKvpC~7X5WtNg__',
        [
          'https://s3-alpha-sig.figma.com/img/2d11/02a3/a9d11b028beb92303cf9f243099d6e4e?Expires=1742169600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=kU6VzXV-XSvc58r2Yt12D7ILqQcaGfGdsLuBGo-T8PkjeZQFmVEgiGyIaLYh~N-0ha2WQYpgtl93yjMnzb4SxDyJ4h8TcTlC6ZVDw0L~GWVY1svWhJJBysoFCteDkJh1rHZhfadQuNjxDiGUnJTPU0vuGjVAAROFN8zh7nl1kVZ0LDt58tJ4Gh4BhgQoE1j7pafi6GX2ZYHlMqP5aKoX03G2DzeyweMg1kkxBe72MSXb5iOVrByI3tjWZLFSydjedgazh4XjpLt0OorZ9bh3HmjXwy-j6JezjJUixyhg4Y~99B2QF-Znue4pXJNCl6XONrHwJAsB9cKvpC~7X5WtNg__',
          'https://s3-alpha-sig.figma.com/img/2d11/02a3/a9d11b028beb92303cf9f243099d6e4e?Expires=1742169600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=kU6VzXV-XSvc58r2Yt12D7ILqQcaGfGdsLuBGo-T8PkjeZQFmVEgiGyIaLYh~N-0ha2WQYpgtl93yjMnzb4SxDyJ4h8TcTlC6ZVDw0L~GWVY1svWhJJBysoFCteDkJh1rHZhfadQuNjxDiGUnJTPU0vuGjVAAROFN8zh7nl1kVZ0LDt58tJ4Gh4BhgQoE1j7pafi6GX2ZYHlMqP5aKoX03G2DzeyweMg1kkxBe72MSXb5iOVrByI3tjWZLFSydjedgazh4XjpLt0OorZ9bh3HmjXwy-j6JezjJUixyhg4Y~99B2QF-Znue4pXJNCl6XONrHwJAsB9cKvpC~7X5WtNg__',
        ],
        '오랜만에 새옷입고 주인이랑 친구만나러 가는 중..\n날씨 댕 좋다 ...',
        2400,
        120,
      ),
      PostDetail(
        3,
        '단비',
        'https://s3-alpha-sig.figma.com/img/2d11/02a3/a9d11b028beb92303cf9f243099d6e4e?Expires=1742169600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=kU6VzXV-XSvc58r2Yt12D7ILqQcaGfGdsLuBGo-T8PkjeZQFmVEgiGyIaLYh~N-0ha2WQYpgtl93yjMnzb4SxDyJ4h8TcTlC6ZVDw0L~GWVY1svWhJJBysoFCteDkJh1rHZhfadQuNjxDiGUnJTPU0vuGjVAAROFN8zh7nl1kVZ0LDt58tJ4Gh4BhgQoE1j7pafi6GX2ZYHlMqP5aKoX03G2DzeyweMg1kkxBe72MSXb5iOVrByI3tjWZLFSydjedgazh4XjpLt0OorZ9bh3HmjXwy-j6JezjJUixyhg4Y~99B2QF-Znue4pXJNCl6XONrHwJAsB9cKvpC~7X5WtNg__',
        [
          'https://s3-alpha-sig.figma.com/img/2d11/02a3/a9d11b028beb92303cf9f243099d6e4e?Expires=1742169600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=kU6VzXV-XSvc58r2Yt12D7ILqQcaGfGdsLuBGo-T8PkjeZQFmVEgiGyIaLYh~N-0ha2WQYpgtl93yjMnzb4SxDyJ4h8TcTlC6ZVDw0L~GWVY1svWhJJBysoFCteDkJh1rHZhfadQuNjxDiGUnJTPU0vuGjVAAROFN8zh7nl1kVZ0LDt58tJ4Gh4BhgQoE1j7pafi6GX2ZYHlMqP5aKoX03G2DzeyweMg1kkxBe72MSXb5iOVrByI3tjWZLFSydjedgazh4XjpLt0OorZ9bh3HmjXwy-j6JezjJUixyhg4Y~99B2QF-Znue4pXJNCl6XONrHwJAsB9cKvpC~7X5WtNg__',
          'https://s3-alpha-sig.figma.com/img/2d11/02a3/a9d11b028beb92303cf9f243099d6e4e?Expires=1742169600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=kU6VzXV-XSvc58r2Yt12D7ILqQcaGfGdsLuBGo-T8PkjeZQFmVEgiGyIaLYh~N-0ha2WQYpgtl93yjMnzb4SxDyJ4h8TcTlC6ZVDw0L~GWVY1svWhJJBysoFCteDkJh1rHZhfadQuNjxDiGUnJTPU0vuGjVAAROFN8zh7nl1kVZ0LDt58tJ4Gh4BhgQoE1j7pafi6GX2ZYHlMqP5aKoX03G2DzeyweMg1kkxBe72MSXb5iOVrByI3tjWZLFSydjedgazh4XjpLt0OorZ9bh3HmjXwy-j6JezjJUixyhg4Y~99B2QF-Znue4pXJNCl6XONrHwJAsB9cKvpC~7X5WtNg__',
        ],
        '오랜만에 새옷입고 주인이랑 친구만나러 가는 중..\n날씨 댕 좋다 ...',
        2400,
        120,
      ),
    ];
  }

  Future<List<CommentDetail>> fetchCommentsByPostId(int postId) async {
    await Future.delayed(Duration(seconds: 1));

    return [
      CommentDetail(
        1,
        '모리',
        DateTime.now().subtract(Duration(hours: 3)),
        '꼬미씨 좀 더울 거 같은데.. 혓바닥 치명적',
      ),
      CommentDetail(
        2,
        '먹보리',
        DateTime.now().subtract(Duration(minutes: 30)),
        '어디가는데 꼬미야',
      ),
      CommentDetail(
        3,
        '꼬미',
        DateTime.now().subtract(Duration(minutes: 10)),
        '한강 갔다가 견팅포차 가려고!',
      ),
    ];
  }
}
