import 'package:flutter/material.dart';
import 'package:nikesneakersshopapp/Core/Widgets/Theme.dart';

class ApplicationAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title; // Changed to required
  final Widget? leadingAppBar;
  final double? titleSize; // Changed to camelCase
  final List<Widget>? actionAppBar;

  const ApplicationAppBar({
    Key? key,
    this.titleSize,
    required this.title, // Made required
    this.leadingAppBar,
    this.actionAppBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: MainColor,
      leading: leadingAppBar, // Pass the leading widget directly
      title: Text(
        title,
        style: TextStyle(
          fontSize: titleSize ?? 34, // Default size if null
          color: const Color(0xff2B2B2B),
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      actions: actionAppBar ?? [], // Default to an empty list if null
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
