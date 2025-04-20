import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:pet_community_app/common/common.dart';
import 'package:pet_community_app/pet/pet.dart';

class PetSelectorBottomSheet extends StatelessWidget {
  const PetSelectorBottomSheet({
    super.key,
    required this.onSelect,
    this.selectedPetId,
  });

  final void Function(PetDetail) onSelect;
  final int? selectedPetId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return MyPetListFetchCubit(context.read<PetRepository>())
          ..fetchMyPetList();
      },
      child: _Content(onSelect: onSelect, selectedPetId: selectedPetId),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({
    super.key,
    required this.onSelect,
    this.selectedPetId,
  });

  final void Function(PetDetail) onSelect;
  final int? selectedPetId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyPetListFetchCubit, MyPetListFetchState>(
      listener: (context, state) {
        state.whenOrNull(
          error: (message, reason) {
            alert(context, title: message, subtitle: reason);
          },
        );
      },
      builder: (_, state) {
        return state.maybeWhen(
          orElse: SizedBox.shrink,
          loaded: (pets) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: DefaultTextStyle(
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                    child: Row(
                      spacing: 4,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        const Text(
                          '프로필 변경',
                          style: TextStyle(fontWeight: FontWeight.w800),
                        ),
                        Text(
                          NumberFormat('#,###').format(pets.length),
                          style: const TextStyle(fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  child: Column(
                    spacing: 16,
                    children: pets
                        .map(
                          (pet) => _PetListTile(
                            onTap: onSelect,
                            pet: pet,
                            isSelected: pet.id == selectedPetId,
                          ),
                        )
                        .toList(),
                    // [
                    // Add Button
                    // _AccountListTile(
                    //   onTap: () {
                    //     Navigator.of(context)
                    //       ..pop()
                    //       ..push(
                    //         MaterialPageRoute(
                    //           builder: (_) => const PetRegistrationScreen(),
                    //         ),
                    //       );
                    //   },
                    //   name: '프로필 추가',
                    //   imageUrl: 'assets/images/add-filled-icon.png',
                    //   hasCheckerIcon: false,
                    // ),
                    // ],
                  ),
                ),
              ],
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}

class _PetListTile extends StatelessWidget {
  const _PetListTile({
    super.key,
    required this.pet,
    this.isSelected = false,
    this.onTap,
  });

  final PetDetail pet;
  final bool isSelected;
  final void Function(PetDetail)? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap?.call(pet);
        Navigator.of(context).pop();
      },
      child: Row(
        spacing: 12,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(pet.profileImageUrl, width: 40, height: 40),
          ),
          Expanded(
            child: Text(
              pet.name,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
            ),
          ),
          if (isSelected) Image.asset('assets/images/checker-filled-icon.png'),
        ],
      ),
    );
  }
}
