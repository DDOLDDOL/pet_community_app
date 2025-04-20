import 'package:my_api_client/my_api_client.dart';
import 'package:pet_community_app/friend/friend.dart';

class FriendRepository {
  const FriendRepository(this.client);

  final ApiClient client;

  Future<List<Friend>> fetchFollowers() async {
    await Future.delayed(Duration(seconds: 1));

    return [
      Friend(1, '초롱이', 'assets/images/fake/fake-profile.png'),
      Friend(1, '초롱이', 'assets/images/fake/fake-profile.png'),
      Friend(1, '초롱이', 'assets/images/fake/fake-profile.png'),
      Friend(1, '초롱이', 'assets/images/fake/fake-profile.png'),
      Friend(1, '초롱이', 'assets/images/fake/fake-profile.png'),
    ];
  }

  Future<List<Friend>> fetchFollowings() async {
    await Future.delayed(Duration(seconds: 1));

    return [
      Friend(1, '초롱이', 'assets/images/fake/fake-profile.png'),
      Friend(1, '초롱이', 'assets/images/fake/fake-profile.png'),
      Friend(1, '초롱이', 'assets/images/fake/fake-profile.png'),
      Friend(1, '초롱이', 'assets/images/fake/fake-profile.png'),
      Friend(1, '초롱이', 'assets/images/fake/fake-profile.png'),
      Friend(1, '초롱이', 'assets/images/fake/fake-profile.png'),
      Friend(1, '초롱이', 'assets/images/fake/fake-profile.png'),
      Friend(1, '초롱이', 'assets/images/fake/fake-profile.png'),
      Friend(1, '초롱이', 'assets/images/fake/fake-profile.png'),
      Friend(1, '초롱이', 'assets/images/fake/fake-profile.png'),
      Friend(1, '초롱이', 'assets/images/fake/fake-profile.png'),
    ];
  }

  Future<void> follow() async {
    await Future.delayed(Duration(seconds: 1));

  }

  Future<void> unfollow() async {
    await Future.delayed(Duration(seconds: 1));

  }
}