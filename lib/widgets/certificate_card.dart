import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CertificateCard extends StatelessWidget {
  final String title;
  final String grade;
  final DateTime date;
  final double hours;
  final Color IconColor;
  final String certificateId;

  const CertificateCard({
    super.key,
    required this.title,
    required this.grade,
    required this.date,
    required this.hours,
    required this.certificateId,
    required this.IconColor,
  });

  @override
  Widget build(BuildContext context) {
    final dateString = DateFormat('MMMM dd, yyyy').format(date);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withAlpha(25),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Icon(Icons.workspace_premium, color: IconColor, size: 28),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "Grade: $grade",
                  style:  TextStyle(color: IconColor, fontWeight: FontWeight.bold,),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600,),),
          const SizedBox(height: 8),
          Text("Awarded to Md Efaj Alam", style: const TextStyle(fontSize: 16,),),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.calendar_today_outlined, size: 16, color: Colors.grey),
              const SizedBox(width: 5),
              Text(dateString, style: const TextStyle(color: Colors.grey)),
              const SizedBox(width: 10),
              const Icon(Icons.timer_outlined, size: 16, color: Colors.grey),
              const SizedBox(width: 5),
              Text("$hours hours", style: const TextStyle(color: Colors.grey)),
            ],
          ),

          Row(
            children: [
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.download_rounded, color: Colors.blueAccent),
                label: const Text("Download"),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.share, color: Colors.purpleAccent),
                label: const Text("Share"),
              ),
            ],
          ),

          const Divider(height: 10),
          Text("Certificate ID: $certificateId",
              style: const TextStyle(fontSize: 12, color: Colors.black54)),
        ],
      ),
    );
  }
}
