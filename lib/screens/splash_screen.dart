import 'package:celoe/screens/login_screen.dart';
import 'package:celoe/theme.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CeloeTheme.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Container(
              width: 140,
              height: 140,
              margin: const EdgeInsets.only(bottom: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.15),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  )
                ]
              ),
              child: Padding(
                padding: const EdgeInsets.all(20), // More breathing room
                child: Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.school, 
                      color: CeloeTheme.primaryColor, 
                      size: 60
                    );
                  },
                ),
              ),
            ),
            
             Padding(
              padding: const EdgeInsets.only(bottom: 20),
               // Placeholder for CeLOE logo - using text for now
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: "ce",
                      style: TextStyle(
                        fontFamily: 'Roboto', // Fallback
                        fontSize: 80,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                        letterSpacing: -5
                      ),
                    ),
                    TextSpan(
                      text: "LO",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                         fontSize: 80,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: -5
                      ),
                    ),
                     TextSpan(
                      text: "e",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 80,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                        letterSpacing: -5
                      ),
                    ),
                  ]
                )
              ),
            ),
            const Text(
              "Learning Management System",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
