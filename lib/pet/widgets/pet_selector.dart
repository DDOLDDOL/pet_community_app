import 'package:flutter/material.dart';
import 'package:pet_community_app/pet/pet.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:useful_widgets/useful_widgets.dart';

class PetSelector extends HookWidget {
  const PetSelector({
    super.key,
    this.fontSize = 24,
    this.spacing = 4,
    this.onSelect,
  });

  final void Function(PetDetail)? onSelect;
  final double fontSize;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    final selectedPet = useState<PetDetail?>(null);

    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {
        showConstrainedBottomSheet(
          context: context,
          builder: (_) => PetSelectorBottomSheet(
            onSelect: (pet) {
              if (pet == selectedPet.value) return;

              selectedPet.value = pet;
              onSelect?.call(pet);
            },
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(4).copyWith(top: 0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 8,
          children: [
            Text(
              selectedPet.value?.name ?? '선택',
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Icon(Icons.keyboard_arrow_down, size: 20),
          ],
        ),
      ),
    );
  }
}
