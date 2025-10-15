import 'package:flutter/material.dart';
import '../widgets/appBar.dart';
import '../widgets/gradient_background.dart';
import '../widgets/section_title.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  static const String name = 'notification-page';

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const AppBarWidget(appBarTitle: 'Notifications'),
      body: GradientBackground(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitle(title: "Recent Notifications"),
              const SizedBox(height: 20),

              Expanded(
                child: _notifications.isEmpty
                    ? _buildEmptyState()
                    : ListView.builder(
                  itemCount: _notifications.length,
                  itemBuilder: (context, index) {
                    final notification = _notifications[index];

                    return Dismissible(
                      key: Key(notification['title'] + index.toString()),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        color: Colors.redAccent,
                        child: const Icon(Icons.delete, color: Colors.white),
                      ),
                      onDismissed: (_) {
                        setState(() {
                          _notifications.removeAt(index);
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Notification deleted')),
                        );
                      },
                      child: _buildNotificationTile(notification, index),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationTile(Map<String, dynamic> notification, int index) {
    return Card(
      color: notification['read'] ? Colors.white.withOpacity(0.9) : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: notification['read'] ? Colors.grey[300] : const Color(0xFF7B61FF),
          child: Icon(
            notification['read'] ? Icons.notifications_none : Icons.notifications_active,
            color: notification['read'] ? Colors.grey[700] : Colors.white,
          ),
        ),
        title: Text(
          notification['title'],
          style: TextStyle(
            fontWeight: notification['read'] ? FontWeight.w500 : FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              notification['message'],
              style: TextStyle(color: Colors.grey[600]),
            ),
            const SizedBox(height: 4),
            Text(
              notification['time'],
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        trailing: notification['read']
            ? null
            : IconButton(
          icon: const Icon(Icons.check_circle, color: Color(0xFF7B61FF)),
          onPressed: () {
            setState(() {
              _notifications[index]['read'] = true;
            });
          },
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.notifications_off_outlined,
              size: 80, color: Colors.white.withAlpha(200)),
          const SizedBox(height: 20),
          const Text(
            "No notifications yet",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          const SizedBox(height: 8),
          Text(
            "You're all caught up!",
            style: TextStyle(fontSize: 14, color: Colors.white.withAlpha(150)),
          ),
        ],
      ),
    );
  }



  List<Map<String, dynamic>> _notifications = [
    {
      "title": "🎉 Welcome to SkillWave!",
      "message": "Start exploring courses and boost your skills.",
      "time": "Just now",
      "read": false,
    },
    {
      "title": "📢 New Course Available",
      "message": "Advanced Flutter Mastery is now live. Enroll today!",
      "time": "10 min ago",
      "read": false,
    },
    {
      "title": "🏆 Certificate Earned",
      "message": "Congratulations! You’ve earned a new certificate.",
      "time": "2 hrs ago",
      "read": true,
    },
    {
      "title": "📅 Upcoming Webinar",
      "message": "Join our live session this Friday at 7 PM.",
      "time": "Yesterday",
      "read": true,
    },
  ];
}

