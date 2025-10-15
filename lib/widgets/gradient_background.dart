import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;

  const GradientBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
     children: [
       Container(
         decoration: const BoxDecoration(
           gradient: LinearGradient(
             colors: [
               Color(0xFF7F00FF),
               Color(0xFFB729CA),
             //  Color(0xFF0F2027),
           //    Color(0xFF203A43),
               Color(0xFF2C5364),
             ],
             begin: Alignment.topLeft,
             end: Alignment.bottomRight,
           ),
         ),
       ),
       SafeArea(child: child)
     ],
    );
  }
}
