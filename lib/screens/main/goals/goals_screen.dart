import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:goly/widgets/app_bars/goals_app_bar.dart';
import 'package:goly/widgets/cards/action_card.dart';
import 'package:goly/widgets/layout/indicators.dart';
import 'package:goly/widgets/list_tile/category_list_tile.dart';
import 'package:goly/widgets/statistics/goals_per_life_area.dart';
import 'package:goly/models/category.dart';
import 'package:goly/screens/main/goals/actions/category/handle_category_screen.dart';
import 'package:goly/utils/constants.dart';
import 'package:goly/utils/utils.dart';

class GoalsScreen extends StatefulWidget {
  static const routeName = '/goals';
  const GoalsScreen({super.key});

  @override
  State<GoalsScreen> createState() => _MainPageState();
}

class _MainPageState extends State<GoalsScreen> {
  void addCategory() {
    GoRouter.of(context).push(HandleCategoryScreen.routeNameAdd);
  }

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = List.empty();
    return Scaffold(
        appBar: const GoalsAppBar(),
        body: SingleChildScrollView(
          padding: Constants.pagePadding,
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('goals')
                  .doc(Utils.currentUid())
                  .collection('categories')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return buffering();
                }
                if (snapshot.data == null) {
                  return const Text('Start adding some categories ');
                }
                snapshot.data?.docs.map((element) {
                  categories.add(CategoryModel.fromJson(element.data()));
                });

                return Column(
                  children: [
                    Text(
                      'Categories',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    ...?snapshot.data?.docs.map(
                      (e) => CategoryCard(
                        category: CategoryModel.fromJson(
                          e.data(),
                        ),
                      ),
                    ),
                    ActionCard(
                      text: "Add category",
                      icon: Icons.add,
                      action: addCategory,
                    ),
                    const SizedBox(height: 40),
                    Text(
                      'Statistics',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const GoalsPerLifeArea(),
                  ],
                );
              }),
        ));
  }
}
