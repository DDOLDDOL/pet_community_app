import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewIndexCubit extends Cubit<int> {
  HomeViewIndexCubit() : super(0);

  void updateHomeViewIndex(int newIndex) => emit(newIndex);
}
