import 'package:my_api_client/my_api_client.dart';
import 'package:pet_community_app/pet/pet.dart';

class PetRepository {
  const PetRepository(this._client);

  final ApiClient _client;

  Future<List<PetDetail>> fetchMyPetList() async {
    await Future.delayed(Duration(seconds: 2));

    return [
      PetDetail(1, 1, '단비', '이쁜 단비', '' /*PetType.dog, isMale: true */),
      PetDetail(2, 1, '밤비', '이쁜 밤비', '' /*PetType.cat, isMale: false*/),
    ];
  }

  Future<void> registerPet() async {
    await Future.delayed(Duration(seconds: 1));
  }
}
