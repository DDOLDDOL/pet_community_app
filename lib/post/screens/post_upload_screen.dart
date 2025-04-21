import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_community_app/common/common.dart';
import 'package:pet_community_app/post/cubits/cubits.dart';
import 'package:useful_widgets/useful_widgets.dart';

class PostUploadScreen extends StatelessWidget {
  const PostUploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => PostUploadInputCubit()),
      ],
      child: const _PostUploadView(),
    );
  }
}

class _PostUploadView extends StatelessWidget {
  const _PostUploadView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            BlocBuilder<PostUploadInputCubit, PostUploadInputState>(
              builder: (_, state) => ThemeImageUploader(
                imageFiles: state.imageDataList,
                onImageCaptured:
                    context.read<PostUploadInputCubit>().addImage,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20).copyWith(top: 0),
                child: Column(
                  children: [
                    Expanded(
                      child: _ContentUploader(
                        onContentUpdated: context
                            .read<PostUploadInputCubit>()
                            .updateContent,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _HashTagsUploader(
                      onHashTagsAdded:
                          context.read<PostUploadInputCubit>().addHashTag,
                      onHashTagsRemoved:
                          context.read<PostUploadInputCubit>().removeHashTag,
                    ),
                    const SizedBox(height: 40),
                    _SubmitButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ContentUploader extends StatefulWidget {
  const _ContentUploader({
    super.key,
    required this.onContentUpdated,
  });

  final void Function(String) onContentUpdated;

  @override
  State<_ContentUploader> createState() => _ContentUploaderState();
}

class _ContentUploaderState extends State<_ContentUploader> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostUploadInputCubit, PostUploadInputState>(
      builder: (_, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 4,
          children: [
            const Text(
              '게시글',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: Color(0xFF17181A),
              ),
            ),
            // TODO: TextInputForm 높이 늘리기
            Expanded(
              child: TextInputField(
                controller: _controller,
                borderRadiusValue: 12,
                backgroundColor: const Color(0xFFF5F8FF),
                enabledBorderSide: BorderSide.none,
                focusedBorderSide: BorderSide.none,
              ),
            ),
          ],
        );
      },
    );
  }
}

class _HashTagsUploader extends StatefulWidget {
  const _HashTagsUploader({
    super.key,
    required this.onHashTagsAdded,
    required this.onHashTagsRemoved,
  });

  final void Function(String) onHashTagsAdded;
  final void Function(int) onHashTagsRemoved;

  @override
  State<_HashTagsUploader> createState() => _HashTagsUploaderState();
}

class _HashTagsUploaderState extends State<_HashTagsUploader> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '해시태그',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: Color(0xFF17181A),
          ),
        ),
        const SizedBox(height: 4),
        TextInputField(
          controller: _controller,
          borderRadiusValue: 12,
          backgroundColor: const Color(0xFFF5F8FF),
          enabledBorderSide: BorderSide.none,
          focusedBorderSide: BorderSide.none,
          hintText: '해시태그를 입력해주세요',
          hintStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xFFB8BECC),
          ),
          innerSuffixIcon: InkWell(
            onTap: () {
              context.read<PostUploadInputCubit>().addHashTag(_controller.text);
              _controller.clear();
            },
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: const Text(
                '등록',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFFB8BECC),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        BlocBuilder<PostUploadInputCubit, PostUploadInputState>(
          builder: (_, state) {
            return Row(
              spacing: 20,
              children: [
                Expanded(
                  child: Row(
                    spacing: 8,
                    children: state.hashTags
                        .map((tag) => _HashTag(label: tag))
                        .toList(),
                  ),
                ),
                DefaultTextStyle(
                  style: const TextStyle(
                    color: Color(0xFF17181A),
                    fontSize: 13,
                  ),
                  child: Row(
                    children: [
                      Text('${state.hashTags.length}'),
                      Text(
                        '/5',
                        style: const TextStyle(fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ],
    );
  }
}

class _HashTag extends StatelessWidget {
  const _HashTag({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: const Color(0xFFF5F8FF),
      ),
      child: Text(
        '#$label',
        style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostUploadInputCubit, PostUploadInputState>(
      builder: (context, state) {
        return SubmitButton(
          enabledColor: Palette.themeColor,
          onPressed: () {
            // 포스트 등록
          },
        );
      },
    );
  }
}
