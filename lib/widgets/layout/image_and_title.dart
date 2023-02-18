import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ImageAndTitle extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String image;
  const ImageAndTitle(
      {super.key, required this.title, this.subtitle, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height / 25),
        SizedBox(
          height: 140.0,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(image),
        ),
        const SizedBox(height: 20.0),
        Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Center(
          child: subtitle == null
              ? null
              : Text(
                  subtitle!,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
        ),
        const SizedBox(height: 25.0),
      ],
    );
  }
}
