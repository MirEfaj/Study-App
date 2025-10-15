import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../widgets/gradient_background.dart';
import '../widgets/logo_screen.dart';
import 'change_password_screen.dart';

class OTP_page extends StatelessWidget {
  OTP_page({super.key});

  static const String name = 'otp';

  final TextEditingController _otpTEcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                const LogoScreen(),
                const SizedBox(height: 40),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white.withAlpha(25),
                        border: Border.all(color: Colors.white24),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text("OTP Verification",
                            style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold,),),
                          const SizedBox(height: 5),
                          const Text("6 digit OTP has been send to your email", style: TextStyle(color: Colors.white70, fontSize: 13,),),
                          const SizedBox(height: 20),

                          PinCodeTextField(
                            length: 6,
                            keyboardType: TextInputType.number,
                            animationType: AnimationType.fade,
                            pinTheme: PinTheme(
                              shape: PinCodeFieldShape.box,
                              borderRadius: BorderRadius.circular(5),
                              fieldHeight: 50,
                              fieldWidth: 40,
                              activeFillColor: Colors.white,
                              selectedColor: Colors.green,
                              inactiveColor: Colors.grey
                            ),
                            animationDuration: Duration(milliseconds: 300),
                            backgroundColor: Colors.transparent,
                            controller: _otpTEcontroller,
                            appContext: context,
                          ),
                          const SizedBox(height: 20),

                          // Submit Button
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: ()=> _submitButton(context),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: const Color(0xFF7F00FF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: const Text(
                                "Submit",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submitButton(BuildContext context) {
    Navigator.pushNamed(context, ChangePasswordScreen.name);
  }

}
