import 'package:flutter/material.dart';
import 'package:goly/models/category.dart';
import 'package:goly/screens/main/goals/actions/category/category_screen.dart';
import 'package:goly/services/category_service.dart';
import 'package:goly/widgets/layout/indicators.dart';
import 'package:tab_container/tab_container.dart';

class UserGoals extends StatelessWidget {
  const UserGoals({super.key});

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = [];
    return StreamBuilder(
        stream: CategoryService.getCategoriesStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return buffering();
          }
          if (snapshot.data == null) {
            return const Center(child: Text('There are no categories'));
          }
          for (var element in snapshot.data!.docs) {
            categories.add(CategoryModel.fromJson(element.data()));
          }
          return SizedBox(
            height: MediaQuery.of(context).size.height - 160,
            child: DefaultTabController(
              length: 7,
              child: Scaffold(
                  appBar: AppBar(
                    centerTitle: true,
                    title: const Text(
                      'Categories',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    bottom: PreferredSize(
                        preferredSize: const Size.fromHeight(30.0),
                        child: TabBar(
                            isScrollable: true,
                            unselectedLabelColor: Colors.white.withOpacity(0.3),
                            indicatorColor: Colors.white,
                            tabs: categories
                                .map((e) => Tab(
                                      child: Text(e.name),
                                    ))
                                .toList())),
                  ),
                  body: TabBarView(
                      children: categories
                          .map((e) => Center(
                                child: Text(e.name),
                              ))
                          .toList())),
            ),
          );
        });
  }
}
