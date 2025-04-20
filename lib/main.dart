import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_api_client/my_api_client.dart';
import 'package:pet_community_app/auth/auth.dart';
import 'package:pet_community_app/friend/friend.dart';
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
    MultiProvider(
      providers: [
        Provider.value(value: ApiClient()),
      ],
      child: const _MultiRepositoryProvider(
        child: _MultiBlocProviderAboveApp(
          child: _App(),
        ),
      ),
    ),
  );
}

class _App extends StatelessWidget {
  const _App();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _appTheme,
      home: const AuthGuard(
        login: LoginScreen.new,
        home: HomeScreen.new,
      ),
    );
  }

  ThemeData get _appTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Suit',
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        toolbarHeight: 54,
        titleTextStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: Color(0xFF1A1E27),
        ),
        centerTitle: true,
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
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
          create: (context) => AuthRepository(
            apiClient: context.read<ApiClient>(),
          ),
        ),
        RepositoryProvider(
          create: (context) => FriendRepository(context.read<ApiClient>()),
        ),
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

class _MultiBlocProviderAboveApp extends StatelessWidget {
  const _MultiBlocProviderAboveApp({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserBloc(context.read<AuthRepository>()),
        ),
      ],
      child: child,
    );
  }
}
