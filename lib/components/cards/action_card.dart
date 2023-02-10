import 'package:flutter/material.dart';

class ActionCard extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function action;
  const ActionCard({super.key, required this.text, required this.icon, required this.action});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
                 onTap: () => action(),          
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: Row(
                children: [
                  Icon(icon),
                  const SizedBox(width: 20,),
                  Text(text),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
