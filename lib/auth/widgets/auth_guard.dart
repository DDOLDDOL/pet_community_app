import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_community_app/auth/auth.dart';

class AuthGuard extends StatelessWidget {
  const AuthGuard({
    super.key,
    required this.login,
    required this.home,
  });

  final Widget Function() login;
  final Widget Function() home;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (_, state) {
        // if (state.isFetching) return const _LoadingView();

        final user = state.user;
        return user == null ? login() : home();
      },
    );
  }
}

class _LoadingView extends StatelessWidget {
  const _LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
