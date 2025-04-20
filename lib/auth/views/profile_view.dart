import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pet_community_app/friend/friend.dart';
import 'package:pet_community_app/pet/pet.dart';
import 'package:useful_widgets/useful_widgets.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ProfileSection(
            imageUrl:
                'https://s3-alpha-sig.figma.com/img/c149/507e/a37e7f88317c7f83ef2bb491470c1dfd?Expires=1745193600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=tsYi~uJN9WNrsJdMKyu-gHaPdinX9hFOqA67edVAy4dq7xvSKoPAgqDCdUarYUoRgKfI2dCENJzgbLjg3M5WnmkE8fnddeKSWsZ8B1w1bi-iLzyef3EJdtqC08jJi26ugSGn9CGiVzVLpf6-8kTvyYF6aRfMffJ3iWbFunSXhZrTFwuDSUjniK6E5uRNBsYYvnGjGZuVq7TSziuJrDAJMEbDO1~aGqEEDBatJ6mjuI52Q2M7cyD3aJqjWdgGmMt2dFp5P~Sx35Uw8pkhSpxiPM~NLxsxS9AvfDm6n7MMZ801NNihYLDIwARsW1n15TAwzgTF7I6LN4a261ZmEezg3A__'),
        Expanded(child: _MyPostListView()),
      ],
    );
  }
}

class _ProfileSection extends StatelessWidget {
  const _ProfileSection({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        spacing: 20,
        children: [
          Row(
            spacing: 12,
            children: [
              // ClipRRect(
              //   borderRadius: BorderRadius.circular(44),
              //   child: CachedNetworkImage(
              //     imageUrl: imageUrl,
              //     width: 88,
              //     height: 88,
              //   ),
              // ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: const Color(0xFFEBEDF3)),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.asset(
                    'assets/images/fake/fake-profile.png',
                    width: 48,
                    height: 48,
                  ),
                ),
              ),
              Column(
                spacing: 4,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: () {
                      showConstrainedBottomSheet(
                        context: context,
                        builder: (_) => PetSelectorBottomSheet(
                          onSelect: (pet) {
                            print('pet detail: $pet');
                          },
                        ),
                      );
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 4,
                      children: [
                        Text(
                          '단비',
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                            color: Color(0xFF2A2E40),
                          ),
                        ),
                        Icon(Icons.keyboard_arrow_down, size: 16),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 20,
                    children: [
                      Text(
                        '팔로워 0',
                        style: const TextStyle(fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 12,
                        child: VerticalDivider(width: 1, color: Colors.black),
                      ),
                      Text(
                        '팔로잉 2',
                        style: const TextStyle(fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          _EditButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => FriendManagingScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _MyPostListView extends StatelessWidget {
  const _MyPostListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: DefaultTextStyle(
            style: TextStyle(fontSize: 16, color: Colors.black),
            child: Row(
              spacing: 4,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  '내가 올린 게시물',
                  style: TextStyle(fontWeight: FontWeight.w800),
                ),
                Text(
                  '(4)',
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: GridView(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 720 / 960,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
            ),
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset('assets/images/fake/fake-pet-model.jpeg'),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset('assets/images/fake/fake-pet-model.jpeg'),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset('assets/images/fake/fake-pet-model.jpeg'),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset('assets/images/fake/fake-pet-model.jpeg'),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset('assets/images/fake/fake-pet-model.jpeg'),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset('assets/images/fake/fake-pet-model.jpeg'),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset('assets/images/fake/fake-pet-model.jpeg'),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset('assets/images/fake/fake-pet-model.jpeg'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _EditButton extends StatelessWidget {
  const _EditButton({
    super.key,
    this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SubmitButton(
      elevation: 0,
      // padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      borderRadiusValue: 8,
      hasSplash: false,
      height: 42,
      border: const BorderSide(color: Color(0xFFEBEDF3)),
      enabledColor: Colors.white,
      enabledButtonTextColor: Colors.black,
      onPressed: onPressed,
      child: const Text(
        '프로필 편집',
        style: TextStyle(fontWeight: FontWeight.w700),
      ),
    );
  }
}
