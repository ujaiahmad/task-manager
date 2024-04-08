import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(50);
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // backgroundColor: Color(0x44000000),
      backgroundColor: Colors.transparent,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: CircleAvatar(),
        )
      ],
    );
  }
}
