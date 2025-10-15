import 'package:flutter/material.dart';
import '../widgets/appBar.dart';
import '../widgets/app_drawer.dart';
import '../widgets/gradient_background.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String name = "home- page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBarWidget(appBarTitle: "Skill-Wave"),
      drawer: AppDrawer(),
      body: GradientBackground(
          child: SingleChildScrollView(
              child: Column(
                children: [

                ],
              ))),
    );
  }
}



