import 'package:flutter/material.dart';

class FollowButton extends StatelessWidget {
  final bool isAlreadyFollowing;
  final VoidCallback onPressed;
  const FollowButton({
    super.key,
    required this.isAlreadyFollowing,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: isAlreadyFollowing
              ? Theme.of(context).colorScheme.onBackground.withAlpha(245)
              : Theme.of(context).colorScheme.primary,
          border: Border.all(
            color: Colors.black45,
          ),
          borderRadius: BorderRadius.circular(999),
        ),
        alignment: Alignment.center,
        width: 250,
        height: 36,
        child: Text(
          isAlreadyFollowing ? 'Unfollow' : 'Follow',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
