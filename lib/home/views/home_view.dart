import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_community_app/common/widgets/fetch_request_bloc_builder.dart';
import 'package:pet_community_app/home/home.dart';
import 'package:pet_community_app/pet/cubits/cubits.dart';
import 'package:pet_community_app/post/cubits/post_list_fetch_cubit.dart';
import 'package:pet_community_app/post/post.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              PostListFetchCubit.create(context)..fetchPostListByPetId(0),
        ),
      ],
      child: const _Content(),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeHeader(),
        Expanded(
          child: FetchRequestBlocBuilder<PostListFetchCubit, List<PostDetail>>(
            onLoading: (_) {
              return const Center(child: CircularProgressIndicator());
            },
            onLoaded: (_, postDetails) {    
              if (postDetails.isEmpty) return const EmptyFollowerSection();

              return ListView(
                children: postDetails
                    .map((postDetail) => PostCard(postDetail: postDetail))
                    .toList(),
              );
            },
            onError: (_, message, reason) {
              return Container();
            },
          ),
        ),
      ],
    );
  }
}

// class _View extends StatefulWidget {
//   const _View({super.key});

//   @override
//   State<_View> createState() => _ViewState();
// }

// class _ViewState extends State<_View> {
//   late final TextEditingController _nameController;
//   late final TextEditingController _emailController;
//   late final TextEditingController _phoneController;
//   late final TextEditingController _ageController;

//   @override
//   void initState() {
//     super.initState();

//     _nameController = TextEditingController();
//     _emailController = TextEditingController();
//     _phoneController = TextEditingController();
//     _ageController = TextEditingController();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         TextInputField(
//           controller: _nameController,
//         ),
//         const SizedBox(height: 20),
//         TextInputField(
//           controller: _emailController,
//         ),
//         const SizedBox(height: 20),
//         TextInputField(
//           controller: _phoneController,
//         ),
//         const SizedBox(height: 20),
//         TextInputField(
//           controller: _ageController,
//         ),
//         const SizedBox(height: 20),
//         SubmitButton(
//           onPressed: () {
//             AppBackendServer().saveUser(
//               _nameController.text,
//               _emailController.text,
//               _phoneController.text,
//               int.tryParse(_ageController.text) ?? 0,
//               true,
//             );
//           },
//           child: Text('쓰기'),
//         ),
//       ],
//     );
//   }
// }
