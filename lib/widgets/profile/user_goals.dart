import 'package:flutter/material.dart';
import 'package:goly/models/category.dart';
import 'package:goly/models/user.dart';
import 'package:goly/services/category_service.dart';
import 'package:goly/widgets/layout/indicators.dart';
import 'package:goly/widgets/profile/profile_category_goals.dart';

class UserGoals extends StatelessWidget {
  final UserModel user;
  const UserGoals({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = [];
    return StreamBuilder(
        stream: CategoryService.getOrderedCategories(uid: user.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return buffering();
          }
          if (snapshot.data == null) {
            return const Center(child: Text('There are no categories'));
          }
          for (var element in snapshot.data!.docs) {
            CategoryModel category = CategoryModel.fromJson(element.data());
            if (!category.private) {
              categories.add(category);
            }
          }
          if (categories.isEmpty) {
            return const Center(
              child: Text('This user has no categories or only empty ones'),
            );
          }
          return SizedBox(
            height: MediaQuery.of(context).size.height - 176,
            child: DefaultTabController(
              length: categories.length,
              child: Scaffold(
                  appBar: AppBar(
                    automaticallyImplyLeading: false,
                    centerTitle: true,
                    // title: const Text(
                    //   'Public categories',
                    //   style: TextStyle(fontSize: 16.0),
                    // ),
                    bottom: PreferredSize(
                        preferredSize: const Size.fromHeight(30.0),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: TabBar(
                              isScrollable: true,
                              tabs: categories
                                  .map((e) => Tab(
                                        child: Text(e.name),
                                      ))
                                  .toList()),
                        )),
                  ),
                  body: TabBarView(
                      children: categories
                          .map((e) => SingleChildScrollView(
                                child: ProfileCategoryGoals(
                                  uid: user.id,
                                  categoryId: e.id,
                                  categoryName: e.name,
                                ),
                              ))
                          .toList())),
            ),
          );
        });
  }
}
