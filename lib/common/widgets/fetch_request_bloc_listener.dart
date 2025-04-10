import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_community_app/common/cubits/fetch_request_cubit.dart';

class FetchRequestBlocListener<T extends FetchRequestCubit>
    extends StatelessWidget {
  const FetchRequestBlocListener({
    super.key,
    required this.listener,
    this.listenWhen,
    this.child,
  });

  final void Function(BuildContext, FetchRequestState<dynamic>) listener;
  final bool Function(
    FetchRequestState<dynamic>,
    FetchRequestState<dynamic>,
  )? listenWhen;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<T, FetchRequestState>(
      listener: listener,
      listenWhen: listenWhen,
      child: child,
    );
  }
}
