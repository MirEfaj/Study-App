import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:study_app/views/registration_page.dart';
import '../widgets/gradient_background.dart';
import '../widgets/logo_screen.dart';
import 'forget_password_screen.dart';
import 'home_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String name = "login-page";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 80),
              const LogoScreen(),
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

                  Text("Log-in",
                       textAlign: TextAlign.center,
                       style:const TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 20),),

                    const SizedBox(height: 20),

                    // Email Field
                    TextField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(hintText: "your@email.com",),
                    ),
                    const SizedBox(height: 16),

                    // Password Field
                    TextField(
                      controller: _passwordController,
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
                        onPressed: _signIn,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: const Color(0xFF7F00FF),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text("Sign In" , style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
              const Text("Unlock your potential with world-class courses",
                style: TextStyle(color: Colors.white70, fontSize: 13,),),
              const SizedBox(height: 10),
              RichText(text: TextSpan(
                text: "Don't have an account? ",
                style: TextStyle(color: Colors.white70, fontSize: 13,),
                children: [
                  TextSpan(
                    text: "Sign-Up",
                    style: TextStyle(fontWeight: FontWeight.w600,color: Colors.green ),
                    recognizer: TapGestureRecognizer()..onTap = _signUp
                  )
                ]
              )),
              const SizedBox(height: 20),
              TextButton(onPressed: _forgetPass, child: Text("Forget Password",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.green ),)),
            ],
          ),
        ),
      ),
    );
  }

  void _signIn(){Navigator.pushNamedAndRemoveUntil(context, HomePage.name, (predicate)=> false);}
  void _signUp(){Navigator.pushNamed(context, RegistrationScreen.name);}
  void _forgetPass(){Navigator.pushNamed(context, ForgetPasswordScreen.name);}

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}




