import 'package:mockito/annotations.dart';
import 'package:my_api_client/my_api_client.dart';

@GenerateMocks([], customMocks: [MockSpec<ApiClient>(as: #MockClient)])
import 'test_api_codes.mocks.dart';