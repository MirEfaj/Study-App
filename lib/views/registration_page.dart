import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../widgets/gradient_background.dart';
import 'home_page.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  static const String name = "Registration-page";

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool isLogin = true;
  final TextEditingController _emailTEcontroller = TextEditingController();
  final TextEditingController _firstNameTEcontroller = TextEditingController();
  final TextEditingController _lastNameTEcontroller = TextEditingController();
  final TextEditingController _phoneTEcontroller = TextEditingController();
  final TextEditingController _passwordTEcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha(51),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(Icons.school, color: Colors.white, size: 60,),
              ),
              const SizedBox(height: 20),
              const Text("SkillWave", style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold,),),
              const SizedBox(height: 5),
              const Text("Start Your Learning Journey", style: TextStyle(color: Colors.white70, fontSize: 14,),),
              const SizedBox(height: 30),

              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha(30),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white24),
                ),
                child: Column(
                  children: [

                    Text("Registration",
                      textAlign: TextAlign.center,
                      style:const TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 20),),

                    const SizedBox(height: 20),

                    TextField(
                      controller: _firstNameTEcontroller,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(hintText: "First Name",),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _lastNameTEcontroller,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(hintText: "Last Name",),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _phoneTEcontroller,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(hintText: "Phone Number",),
                    ),
                    const SizedBox(height: 16),

                    // Email Field
                    TextField(
                      controller: _emailTEcontroller,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(hintText: "your@email.com",),
                    ),
                    const SizedBox(height: 16),

                    // Password Field
                    TextField(
                      controller: _passwordTEcontroller,
                      obscureText: true,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(hintText: "Password",),
                    ),
                    const SizedBox(height: 20),

                    // Login Button
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _signUp,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: const Color(0xFF7F00FF),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text("Sign-Up" , style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
              const Text("Unlock your potential with world-class courses",
                style: TextStyle(color: Colors.white70, fontSize: 13,),),
              const SizedBox(height: 30),
              RichText(text: TextSpan(
                  text: "Have an account? ",
                  style: TextStyle(color: Colors.white70, fontSize: 13,),
                  children: [
                    TextSpan(
                        text: "Sign-In",
                        style: TextStyle(fontWeight: FontWeight.w600,color: Colors.green ),
                        recognizer: TapGestureRecognizer()..onTap = _signIn
                    )
                  ]
              ))
            ],
          ),
        ),
      ),
    );
  }

  void _signIn(){Navigator.pop(context);}
  void _signUp(){Navigator.pushNamedAndRemoveUntil(context, HomePage.name, (predicate)=> false);}

  @override
  void dispose() {
    _firstNameTEcontroller.dispose();
    _lastNameTEcontroller.dispose();
    _phoneTEcontroller.dispose();
    _emailTEcontroller.dispose();
    _passwordTEcontroller.dispose();
    super.dispose();
  }
}
