import 'dart:ui';
import 'package:flutter/material.dart';
import '../widgets/appBar.dart';
import '../widgets/gradient_background.dart';

class ProfileSettingsPage extends StatefulWidget {
  const ProfileSettingsPage({super.key});

  static const String name = 'ProfileSettingsPage';

  @override
  State<ProfileSettingsPage> createState() => _ProfileSettingsPageState();
}

class _ProfileSettingsPageState extends State<ProfileSettingsPage> {
  final _nameController = TextEditingController(text: "Md Efaj");
  final _emailController = TextEditingController(text: "mdefaj25@gmail.com");
  final _phoneController = TextEditingController(text: "+880 1679828659");
  final _locationController = TextEditingController(text: "Dhaka, Bangladesh");
  final _occupationController = TextEditingController(text: "Software Developer");

  bool emailNotifications = true;
  bool pushNotifications = true;
  bool courseUpdates = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(appBarTitle: 'Profile Settings',),
      extendBodyBehindAppBar: true,
      body: GradientBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header
              Column(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 50, color: Colors.grey),
                  ),
                  const SizedBox(height: 10),
                  Text(_nameController.text, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600,),),
                  const SizedBox(height: 5),
                  Text(_emailController.text, style: const TextStyle(color: Colors.white70),),
                  const SizedBox(height: 5),
                  const Text("Software Developer · San Francisco, CA", style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Personal Info
              _buildSectionCard(
                title: "Personal Information",
                child: Column(
                  children: [
                    _buildTextField("Full Name", _nameController),
                    _buildTextField("Email Address", _emailController),
                    _buildTextField("Phone Number", _phoneController),
                    _buildTextField("Location", _locationController),
                    _buildTextField("Occupation", _occupationController),
                    const SizedBox(height: 10),
                    _buildButton("Save Changes", Colors.deepPurple),
                  ],
                ),
              ),

              // Security
              _buildSectionCard(
                title: "Security",
                child: Column(
                  children: [
                    _buildTextField("Current Password", TextEditingController(), obscureText: true),
                    _buildTextField("New Password", TextEditingController(), obscureText: true),
                    const SizedBox(height: 10),
                    _buildButton("Update Password", Colors.deepPurple),
                  ],
                ),
              ),

              // Notifications
              _buildSectionCard(
                title: "Notifications",
                child: Column(
                  children: [
                    SwitchListTile(
                      value: emailNotifications,
                      onChanged: (val) => setState(() => emailNotifications = val),
                      title: const Text("Email Notifications"),
                    ),
                    SwitchListTile(
                      value: pushNotifications,
                      onChanged: (val) => setState(() => pushNotifications = val),
                      title: const Text("Push Notifications"),
                    ),
                    SwitchListTile(
                      value: courseUpdates,
                      onChanged: (val) => setState(() => courseUpdates = val),
                      title: const Text("Course Updates"),
                    ),
                  ],
                ),
              ),

              // Preferences
              _buildSectionCard(
                title: "Preferences",
                child: DropdownButtonFormField<String>(
                  value: "English",
                  items: const [
                    DropdownMenuItem(value: "English", child: Text("English")),
                    DropdownMenuItem(value: "Spanish", child: Text("Spanish")),
                    DropdownMenuItem(value: "French", child: Text("French")),
                  ],
                  onChanged: (val) {},
                  decoration: const InputDecoration(
                    labelText: "Language",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionCard({required String title, required Widget child}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                const SizedBox(height: 15),
                child,
              ],
            ),
          ),
        )
        );

  }

  Widget _buildTextField(String label, TextEditingController controller,
      {bool obscureText = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.black87),
          enabledBorder: OutlineInputBorder(borderSide: const BorderSide(width: 2, color: Color(0xff9100ff),), borderRadius: BorderRadius.circular(8),),
          focusedBorder: OutlineInputBorder(borderSide: const BorderSide(width: 2.5, color: Color(0xff9100ff),), borderRadius: BorderRadius.circular(8),),
          border: OutlineInputBorder(borderSide: const BorderSide(width: 2, color: Color(0xff9100ff),), borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }


  Widget _buildButton(String text, Color color) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8),),),
        onPressed: () {},
        child: Text(text, style: const TextStyle(fontSize: 16, color: Colors.white),),
      ),
    );
  }


  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _locationController.dispose();
    _occupationController.dispose();
    super.dispose();
  }
}

