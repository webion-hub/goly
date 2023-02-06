import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              //color: Theme.of(context).colorScheme.primary.withOpacity(0.2)
            ),
            child: const Icon(Icons.dark_mode),
          ),
          title: const Text(
            "Change theme",
          ),
          onTap: () {},
          trailing: CupertinoSwitch(
            onChanged: (value) {}, value: false,
          ),

        ),
        const Divider(),
      ],
    );
  }
}
