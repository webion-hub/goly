import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DescriptionCard extends StatelessWidget {
  final String text;
  const DescriptionCard({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        color: Theme.of(context).canvasColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Description", style: Theme.of(context).textTheme.subtitle2,),
              const SizedBox(height: 20),
              Text(text),
            ],
          ),
        ),
      ),
    );
  }
}
