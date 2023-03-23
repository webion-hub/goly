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
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom().copyWith(
        minimumSize: const MaterialStatePropertyAll(
          Size.fromHeight(40),
        ),
      ),
      child: Text(
        isAlreadyFollowing ? 'Unfollow' : 'Follow',
        style: const TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
