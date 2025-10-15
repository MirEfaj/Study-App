import 'package:flutter/material.dart';

class LogoScreen extends StatelessWidget {
  const LogoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(51),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Icon(Icons.school_outlined, color: Colors.white, size: 60,),
        ),
        const SizedBox(height: 20),
        const Text("SkillWave", style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold,),),
        const SizedBox(height: 5),
        const Text("Start Your Learning Journey", style: TextStyle(color: Colors.white70, fontSize: 14,),),
      ],
    );
  }
}