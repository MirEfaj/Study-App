import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String appBarTitle ;
  const AppBarWidget({super.key, required this.appBarTitle});


  @override
  Widget build(BuildContext context) {
    return AppBar(
      title:  Text(
        appBarTitle ,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.white10,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
