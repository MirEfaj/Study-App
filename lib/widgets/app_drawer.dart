import 'package:flutter/material.dart';
import '../views/about_screen.dart';
import '../views/certificates.dart';
import '../views/dashboard.dart';
import '../views/help_and_support.dart';
import '../views/login_page.dart';
import '../views/my_courses.dart';
import '../views/notifications_screen.dart';
import '../views/profile_settings_page.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
   //   backgroundColor: Colors.white.withAlpha(20),
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            margin: EdgeInsets.all(0),
            padding: EdgeInsets.all(0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF7F00FF), Color(0xFFB729CA)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  child: Icon(Icons.person_outline, size: 50,),
                ),
                const SizedBox(height: 10,),
                Text("Md Efaj Alam", style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white ),)
              ],
            )
          ),

          _buildListTile(
            icon: Icons.home_outlined,
            iconColor: Colors.blue,
            iconBgColor: Colors.blue.shade50,
            text: 'Home',
            onTap: (){Navigator.pop(context);},
          ),
          _buildListTile(
            icon: Icons.grid_view_outlined,
            iconColor: Colors.teal,
            iconBgColor: Colors.teal.shade50,
            text: 'Dashboard',
            onTap: () {Navigator.pushNamed(context, Dashboard.name);},
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          ),
          _buildListTile(
            icon: Icons.book_outlined,
            iconColor: Colors.green.shade600,
            iconBgColor: Colors.green.shade50,
            text: 'My Courses',
            onTap: (){Navigator.pushNamed(context, MyCoursesScreen.name);},
          ),
          _buildListTile(
            icon: Icons.workspace_premium,
            iconColor: Colors.yellow.shade800,
            iconBgColor: Colors.yellow.shade50,
            text: 'Certificates',
            onTap: () {Navigator.pushNamed(context, CertificateScreen.name);},
          ),
          _buildListTile(
            icon: Icons.notifications_none_outlined,
            iconColor: Colors.purple,
            iconBgColor: Colors.purple.shade50,
            text: 'Notifications',
            onTap: () {Navigator.pushNamed(context, NotificationsScreen.name);},
          ),
          _buildListTile(
            icon: Icons.person_outlined,
            iconColor: Colors.greenAccent.shade700,
            iconBgColor: Colors.greenAccent.shade100,
            text: 'Profile Settings',
            onTap: () {Navigator.pushNamed(context, ProfileSettingsPage.name);},
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          ),
          _buildListTile(
            icon: Icons.info_outline_rounded,
            iconColor: Colors.orange,
            iconBgColor: Colors.orange.shade50,
            text: 'Help & Support',
            onTap: () {Navigator.pushNamed(context, HelpAndSupport.name);},
          ),
          _buildListTile(
            icon: Icons.help_outline_outlined,
            iconColor: Colors.blue,
            iconBgColor: Colors.blue.shade50,
            text: 'About',
            onTap: () {Navigator.pushNamed(context, AboutScreen.name);},
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child:  Divider(
              color: Colors.red.shade200,
              height: 20,
            ),
          ),
          _buildListTile(
            icon: Icons.logout,
            iconColor: Colors.red,
            iconBgColor: Colors.red.shade100,
            text: 'Logout',
            onTap: () {Navigator.pushNamedAndRemoveUntil(context, LoginScreen.name, (predicate)=> false);},
          ),

          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Center(child: Text("Version 1.0.0", style: TextStyle(color: Colors.black54, fontSize: 12),)),
          )
        ],
      ),
    );
  }



  /// Reusable method to create a ListTile with a colored icon and shadow
  Widget _buildListTile({
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
    required String text,
    required VoidCallback onTap,
    Widget ? trailing,
  }) {
    return ListTile(
      leading: Material(
        color: iconBgColor,
        elevation: 2,
        borderRadius: BorderRadius.circular(5),
        child: SizedBox(width: 30, height: 30,
          child: Icon(icon, color: iconColor, size: 20),
        ),
      ),
      title: Text(text, style: const TextStyle(color: Colors.black),),
      trailing: trailing,
      onTap: onTap,
    );
  }

}
