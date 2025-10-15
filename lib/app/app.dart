import 'package:flutter/material.dart';
import '../views/about_screen.dart';
import '../views/certificates.dart';
import '../views/change_password_screen.dart';
import '../views/dashboard.dart';
import '../views/forget_password_screen.dart';
import '../views/help_and_support.dart';
import '../views/home_page.dart';
import '../views/login_page.dart';
import '../views/my_courses.dart';
import '../views/notifications_screen.dart';
import '../views/otp_page.dart';
import '../views/profile_settings_page.dart';
import '../views/registration_page.dart';
import '../views/splash_screen.dart';

class StudyApp extends StatelessWidget {
  const StudyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       theme: ThemeData(
      brightness: Brightness.light,

         inputDecorationTheme: InputDecorationTheme(
           hintStyle: const TextStyle(color: Colors.white54),
           filled: true,
           fillColor: Colors.white.withAlpha(25),
           contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
           enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none,),
           focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none,),
           errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none,),
           focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none,),
           border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none,),
         ),



      textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.black)),
    ),


      home: SplashScreen(),
      initialRoute: SplashScreen.name,
      routes:{
        SplashScreen.name : (context) => SplashScreen(),
        LoginScreen.name : (context) => LoginScreen(),
        ForgetPasswordScreen.name : (context) => ForgetPasswordScreen(),
        OTP_page.name : (context) => OTP_page(),
        ChangePasswordScreen.name : (context) => ChangePasswordScreen(),
        RegistrationScreen.name : (context) => RegistrationScreen(),
        HomePage.name : (context) => HomePage(),
        Dashboard.name : (context) => Dashboard(),
        CertificateScreen.name : (context) => CertificateScreen(),
        HelpAndSupport.name : (context) => HelpAndSupport(),
        NotificationsScreen.name : (context) => NotificationsScreen(),
        ProfileSettingsPage.name : (context) => ProfileSettingsPage(),
        AboutScreen.name : (context) => AboutScreen(),
        MyCoursesScreen.name : (context) => MyCoursesScreen(),
      },
    );
  }
}
