import 'package:my_api_client/my_api_client.dart';
import 'package:pet_community_app/pet/pet.dart';

class PetRepository {
  const PetRepository(this._client);

  final ApiClient _client;

  Future<List<PetDetail>> fetchMyPetList() async {
    await Future.delayed(Duration(seconds: 2));

    return [
      const PetDetail(
        1,
        1,
        '단비',
        '단비에용',
        'assets/images/fake/fake-profile.png',
      ),
      const PetDetail(
        1,
        1,
        '단비',
        '단비에용',
        'assets/images/fake/fake-profile.png',
      ),
      const PetDetail(
        1,
        1,
        '단비',
        '단비에용',
        'assets/images/fake/fake-profile.png',
      ),
    ];
  }

  Future<void> registerPet() async {
    await Future.delayed(Duration(seconds: 1));
  }
}
