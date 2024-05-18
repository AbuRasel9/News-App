import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/view/home_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomeView(),), (
          route) => false);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Image.asset(
              "images/splash_pic.jpg",
              height: screenSize.height * .7,
              fit: BoxFit.cover,
            ),
            // Spacer(),
            SizedBox(height: screenSize.height * 0.09,),
            Text(
              "TOP HEADLINES",
              style: GoogleFonts.anton(
                  color: Colors.grey.shade700, letterSpacing: .5),
            ),
            const SizedBox(
              height: 10,
            ),
            const SpinKitChasingDots(
              color: Colors.blue,
              size: 45,
            ),

          ],
        ),
      ),
    );
  }
}
