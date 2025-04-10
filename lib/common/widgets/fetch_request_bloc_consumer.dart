import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_community_app/common/cubits/fetch_request_cubit.dart';

class FetchRequestBlocConsumer<T extends FetchRequestCubit>
    extends StatelessWidget {
  const FetchRequestBlocConsumer({
    super.key,
    required this.builder,
    required this.listener,
    this.buildWhen,
    this.listenWhen,
  });

  final Widget Function(BuildContext, dynamic) builder;
  final void Function(BuildContext, FetchRequestState<dynamic>) listener;
  final bool Function(dynamic, dynamic)? buildWhen;
  final bool Function(
    FetchRequestState<dynamic>,
    FetchRequestState<dynamic>,
  )? listenWhen;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<T, FetchRequestState>(
      builder: builder,
      buildWhen: buildWhen,
      listener: listener,
      listenWhen: listenWhen,
    );
  }
}
