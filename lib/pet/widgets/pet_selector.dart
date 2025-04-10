import 'package:flutter/material.dart';
import 'package:pet_community_app/common/common.dart';
import 'package:pet_community_app/pet/models/pet_detail.dart';

class PetSelector extends StatelessWidget {
  const PetSelector({
    super.key,
    required this.onSelected,
  });

  final void Function(PetDetail) onSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('단비', style: TextStyles.accent),
        const SizedBox(width: 4),
        Icon(Icons.keyboard_arrow_down_outlined, size: 24),
      ],
    );
  }
}
