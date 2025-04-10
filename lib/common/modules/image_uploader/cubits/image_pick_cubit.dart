import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pet_community_app/common/common.dart';

part 'image_pick_state.dart';
part 'image_pick_cubit.freezed.dart';

class ImagePickCubit  extends Cubit<ImagePickState>{
  ImagePickCubit(this._repository) : super(const ImagePickState.initial());

  final ImageUploaderRepository _repository;

  Future<void> pickImage() async {
    // final images = _repository.

  }
}