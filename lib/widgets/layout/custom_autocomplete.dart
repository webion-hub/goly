// import 'package:flutter/material.dart';
// import 'package:goly/services/category_service.dart';
// import 'package:goly/widgets/layout/indicators.dart';

// class CustomAutocomplete extends StatefulWidget {
//   const CustomAutocomplete({super.key});

//   @override
//   State<CustomAutocomplete> createState() => _CustomAutocompleteState();
// }

// class _CustomAutocompleteState extends State<CustomAutocomplete> {
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//         future: CategoryService.getAllGoalsForAutocomplete(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return buffering();
//           }
//           List<String> data = snapshot.data!;
//           return Autocomplete<String>(
//             optionsBuilder: (TextEditingValue textEditingValue) {
//               if (textEditingValue.text == '') {
//                 return const Iterable<String>.empty();
//               }
//               return data.where((String option) {
//                 return option.contains(textEditingValue.text.toLowerCase());
//               });
//             },
//             onSelected: (String selection) {
//               debugPrint('You just selected $selection');
//             },
//           );
//         });
//   }
// }
