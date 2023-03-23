// import 'package:dropdown_search/dropdown_search.dart';
// import 'package:flutter/material.dart';
// import 'package:goly/models/goal.dart';
// import 'package:goly/services/category_service.dart';
// import 'package:goly/widgets/form/input/input_label.dart';
// import 'package:goly/widgets/layout/indicators.dart';

// class GoalDropdown extends StatelessWidget {
//   final String? categoryId;
//   final String? selectedGoal;
//   const GoalDropdown({super.key, required this.categoryId});

//   @override
//   Widget build(BuildContext context) {
//     if (categoryId == null) {
//       return SizedBox();
//     }
//     return FutureBuilder(
//         future: CategoryService.getCategoryGoals(categoryId: categoryId!),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return buffering();
//           }
//           List<String> goals = [];
//           snapshot.data!.docs.map((e) => goals.add(GoalModel.fromJson(
//                 e.data(),
//               ).name));

//           return Column(
//             children: [
//               const SizedBox(height: 20),
//               const InputLabel(text: 'Goal'),
//               DropdownSearch<String>(
//                 selectedItem: selectedGoal,
//                 onChanged: (value) {
//                   selectedGoal = value;
//                 },
//                 items: categories.map((e) => e.name).toList(),
//                 dropdownDecoratorProps: const DropDownDecoratorProps(
//                   dropdownSearchDecoration: InputDecoration(
//                     labelText: "Choose a goal",
//                     hintText: "Goal",
//                   ),
//                 ),
//               ),
//             ],
//           );
//         });
//   }
// }
