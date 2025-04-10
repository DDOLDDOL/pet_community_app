import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_community_app/common/common.dart';
import 'package:pet_community_app/pet/pet.dart';
import 'package:useful_widgets/useful_widgets.dart';

// TODO: 코드 리팩토링 (useful widgets로 분리)
// TODO: 상태관리 (등록 & 등록 input)
// TODO: scroll view (키보드 up 시 처리) 적용
// TODO: 모든 정보가 입력되었을 때 등록 버튼 활성화

class PetRegistrationScreen extends StatelessWidget {
  const PetRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PetRegistrationCubit(
            context.read<PetRepository>(),
          ),
        ),
      ],
      child: const _PetRegistrationView(),
    );
  }
}

class _PetRegistrationView extends StatefulWidget {
  const _PetRegistrationView({super.key});

  @override
  State<_PetRegistrationView> createState() => __PetRegistrationViewState();
}

class __PetRegistrationViewState extends State<_PetRegistrationView> {
  late final TextEditingController _nameController;
  late final TextEditingController _ageController;
  late final TextEditingController _breedController;
  late final TextEditingController _sexController;

  @override
  void initState() {
    super.initState();

    _nameController = TextEditingController();
    _ageController = TextEditingController();
    _breedController = TextEditingController();
    _sexController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _breedController.dispose();
    _sexController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PetImagePicker(
                    onImagePicked: (image) {},
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                spacing: 20,
                children: [
                  _InputField(controller: _nameController, title: '이름'),
                  _SelectorField(
                    title: '종',
                    hintText: '종을 선택해주세요',
                    items: const ['강아지', '고양이'],
                    itemTextParser: (item) => item,
                  ),
                  _SelectorField(
                    title: '성별',
                    hintText: '성별을 선택해주세요',
                    items: const ['♂', '♀'],
                    itemTextParser: (item) => item,
                  ),
                  _InputField(controller: _ageController, title: '나이'),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: BlocBuilder<PetRegistrationCubit, PetRegistrationState>(
                builder: (_, state) {
                  return SubmitButton(
                    enabledColor: Palette.themeColor,
                    loadingWhen: state.whenOrNull(loading: () => true) ?? false,
                    onPressed: () {
                      context.read<PetRegistrationCubit>().registerPet();
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InputField extends StatelessWidget {
  const _InputField({
    super.key,
    required this.controller,
    required this.title,
    this.hintText,
  });

  final TextEditingController controller;
  final String title;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextInputField(
      controller: controller,
      enabledBorderSide: const BorderSide(color: Colors.transparent),
      focusedBorderSide: BorderSide(color: Colors.grey.shade600, width: 2),
      backgroundColor: Colors.grey.shade100,
      borderRadiusValue: 12,
      contentPadding: const EdgeInsets.all(16),
      title: title,
      textStyle: TextStyles.textBig.copyWith(
        fontFamily: 'SUIT',
        color: Colors.black,
      ),
      hintText: hintText,
      hintStyle: TextStyles.textBig.copyWith(
        fontFamily: 'SUIT',
        color: Colors.grey.shade400,
      ),
    );
  }
}

class _SelectorField<T> extends StatefulWidget {
  const _SelectorField({
    super.key,
    required this.items,
    required this.itemTextParser,
    required this.title,
    this.hintText,
    this.onSelect,
  });

  final List<T> items;
  final String Function(T) itemTextParser;
  final String title;
  final String? hintText;
  final void Function(T)? onSelect;

  @override
  State<_SelectorField<T>> createState() => _SelectorFieldState<T>();
}

class _SelectorFieldState<T> extends State<_SelectorField<T>> {
  late final TextEditingController _controller;
  late final FocusNode _focus;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController();
    _focus = FocusNode()
      ..addListener(() {
        if (_focus.hasFocus) _focus.unfocus();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focus.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextInputField(
      controller: _controller,
      focusNode: _focus,
      onTap: () async {
        final result = await showConstrainedBottomSheet<T>(
          context: context,
          builder: (context) {
            return ListView(
              shrinkWrap: true,
              children: widget.items
                  .map(
                    (item) => InkWell(
                      onTap: () {
                        Navigator.of(context).pop<T>(item);
                        _controller.text = widget.itemTextParser(item);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        alignment: Alignment.center,
                        child: Text(
                          widget.itemTextParser(item),
                          style: TextStyles.textBig,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            );
          },
        );

        if (result == null) return;
        widget.onSelect?.call(result);
      },
      enabledBorderSide: const BorderSide(color: Colors.transparent),
      focusedBorderSide: BorderSide(color: Colors.grey.shade600, width: 2),
      backgroundColor: Colors.grey.shade100,
      borderRadiusValue: 12,
      contentPadding: const EdgeInsets.all(16),
      title: widget.title,
      textStyle: TextStyles.textBig.copyWith(
        fontFamily: 'SUIT',
        color: Colors.black,
      ),
      hintText: widget.hintText,
      hintStyle: TextStyles.textBig.copyWith(
        fontFamily: 'SUIT',
        color: Colors.grey.shade400,
      ),
      innerSuffixIcon: const Icon(
        Icons.keyboard_arrow_down,
        size: 16,
        color: Colors.black,
      ),
    );
  }
}
