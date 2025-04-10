import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_community_app/common/cubits/fetch_request_cubit.dart';

class FetchRequestBlocBuilder<T extends FetchRequestCubit<R>, R>
    extends StatelessWidget {
  const FetchRequestBlocBuilder({
    super.key,
    required this.onLoading,
    required this.onLoaded,
    required this.onError,
    this.buildWhen,
  });

  final Widget Function(BuildContext) onLoading;
  final Widget Function(BuildContext, R) onLoaded;
  final Widget Function(BuildContext, String, String) onError;
  final bool Function(dynamic, dynamic)? buildWhen;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<T, FetchRequestState>(
      builder: (context, state) {
        return state.when(
          initial: SizedBox.shrink,
          loading: () => onLoading(context),
          loaded: (result) => onLoaded(context, result as R),
          error: (message, reason) => onError(context, message, reason),
        );
      },
      buildWhen: buildWhen,
    );
  }
}
