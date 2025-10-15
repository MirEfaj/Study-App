import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final IconData? icon;
  final Color color;

  const SectionTitle({
    super.key,
    required this.title,
    this.icon,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          if (icon != null)
            Icon(icon, color: color, size: 22,),
          if (icon != null) const SizedBox(width: 8),
          Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color,),),
          const SizedBox(width: 6),
          Expanded(child: Container(height: 1, color: color.withAlpha(75),),
          ),
        ],
      ),
    );
  }
}
