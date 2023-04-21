import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:goly/models/category.dart';
import 'package:goly/services/category_service.dart';
import 'package:goly/services/user_service.dart';
import 'package:goly/utils/constants.dart';
import 'package:goly/utils/utils.dart';
import 'package:goly/widgets/form/buttons/follow_button.dart';
import 'package:goly/widgets/form/buttons/main_outlined_button.dart';
import 'package:goly/widgets/layout/custom_divider.dart';
import 'package:goly/widgets/layout/indicators.dart';
import 'package:goly/widgets/profile/profile_category_goals.dart';
import 'package:goly/widgets/profile/user_image.dart';
import 'package:goly/models/user.dart';
import 'package:goly/screens/main/profile/handle_profile_screen.dart';

class UserProfile extends StatelessWidget {
  final UserModel user;
  const UserProfile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = [];
    void goToHandleProfileScreen() {
      GoRouter.of(context).push(HandleProfileScreen.routeNameEdit, extra: user);
    }

    var publicProfileInformations = Column(
      children: [
        Row(
          children: [
            Column(
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: UserImage(imageUrl: user.photoUrl),
                ),
              ],
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildStatColumn(user.following.length, 'Followings'),
                      buildStatColumn(user.followers.length, 'Followers'),
                    ],
                  ),
                  const SizedBox(height: 20),
                  user.id == Utils.currentUid()
                      ? MainOutlinedButton(
                          fullWidth: true,
                          text: 'Edit profile',
                          icon: Icons.edit,
                          action: goToHandleProfileScreen,
                        )
                      : FollowButton(
                          isAlreadyFollowing: user.followers.contains(Utils.currentUid()),
                          onPressed: () async {
                            await UserService.followUser(Utils.currentUid(), user.id);
                          },
                        ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            user.username,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        const SizedBox(height: 10),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(user.bio, maxLines: 4, ),
        ),
        const SizedBox(height: 10),
        const CustomDivider(),
        const SizedBox(height: 10),
        user.settings.privateAccount 
          ? const ListTile(
            title: Text('This user is private'),
            leading: Icon(Icons.lock),
          ) 
          : const Text(
              'Public categories',
              style: TextStyle(fontSize: 16.0),
            ),
      ],
    );
    return user.settings.privateAccount 
      ?  publicProfileInformations
      : StreamBuilder(
        stream: CategoryService.getOrderedCategories(uid: user.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return buffering();
          }
          if (snapshot.data == null) {
            return publicProfileInformations;
          }
          for (var element in snapshot.data!.docs) {
            CategoryModel category = CategoryModel.fromJson(element.data());
            if (!category.private) {
              categories.add(category);
            }
          }
          if (categories.isEmpty) {
            return const Center(
              child: Text('This user has no public categories'),
            );
          }
          return  DefaultTabController(
            length: categories.length,
            child: NestedScrollView(
              physics: const NeverScrollableScrollPhysics(),
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    collapsedHeight: 300,
                    expandedHeight: 300,
                    flexibleSpace: Padding(
                      padding: Constants.pagePadding,
                      child: publicProfileInformations,
                    ),
                  ),
                  SliverPersistentHeader(
                    floating: true,
                    pinned: true,
                    delegate: MyDelegate(
                      tabBar: TabBar(
                        isScrollable: true,
                        tabs: categories
                            .map((e) => Tab(
                                  child: Text(e.name),
                                ))
                            .toList(),
                      ),
                    ),
                  )
                ];
              },
              body: TabBarView(
                  children: categories
                      .map((e) => ProfileCategoryGoals(
                            uid: user.id,
                            categoryId: e.id,
                            categoryName: e.name,
                          ))
                      .toList()),
            ),
          );
        });
  }

  Column buildStatColumn(int num, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          num.toString(),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 4),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}

class MyDelegate extends SliverPersistentHeaderDelegate {
  TabBar tabBar;
  MyDelegate({required this.tabBar});
  @override
  double get minExtent => tabBar.preferredSize.height;
  @override
  double get maxExtent => tabBar.preferredSize.height;
  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: tabBar,
    );
  }
}
