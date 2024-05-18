import 'package:flutter/material.dart';
import 'package:news_app/provider/api_call_provider.dart';
import 'package:news_app/provider/theme_provider.dart';
import 'package:news_app/view/splash_screen.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context)=>ThemeProvider()),
      ChangeNotifierProvider(create: (context)=>ApiCallProvider())
    ],
      child: MaterialApp(
        home: SplashScreen(),
      ),

    );
  }
}
