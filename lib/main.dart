import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_api_client/my_api_client.dart';
import 'package:pet_community_app/home/home.dart';
import 'package:pet_community_app/pet/pet.dart';
import 'package:pet_community_app/post/post.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  runApp(
    MultiBlocProvider(
      providers: [
        Provider.value(value: ApiClient()),
      ],
      child: const _App(),
    ),
  );
}

class _App extends StatelessWidget {
  const _App();

  @override
  Widget build(BuildContext context) {
    return _MultiRepositoryProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          // fontFamily: 'Suit',
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            foregroundColor: Colors.black,
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
          ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}

class _MultiRepositoryProvider extends StatelessWidget {
  const _MultiRepositoryProvider({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => PostRepository(context.read<ApiClient>()),
        ),
        RepositoryProvider(
          create: (context) => PetRepository(context.read<ApiClient>()),
        ),
      ],
      child: child,
    );
  }
}
