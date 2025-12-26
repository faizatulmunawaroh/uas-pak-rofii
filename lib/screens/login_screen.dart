import 'package:celoe/screens/home_screen.dart';
import 'package:celoe/theme.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                 // Placeholder for building image
                Container(
                  height: 300,
                  width: double.infinity,
                  color: Colors.grey.shade300,
                  child: Image.asset('assets/images/login_header.png', fit: BoxFit.cover),
                ),
                 Positioned(
                   bottom: -40,
                   left: 0,
                   right: 0,
                   child: Center(
                     child: Container(
                       padding: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                        color: CeloeTheme.primaryColor,
                        shape: BoxShape.circle
                      ),
                      child: const Icon(Icons.school, color: Colors.white, size: 50), // Logo Placeholder
                     ),
                   ),
                 )
              ],
            ),
            const SizedBox(height: 50),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 30),
                  
                  // Email Field
                  const Text("Email 365", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
                  TextField(
                    decoration: InputDecoration(
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 2),
                        ),
                    ),
                  ),

                  const SizedBox(height: 20),
                   // Password Field
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Password", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
                      IconButton(
                        icon: Icon(_obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      )
                    ],
                  ),
                   TextField(
                     obscureText: _obscurePassword,
                    decoration: const InputDecoration(
                         enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 2),
                        ),
                    ),
                  ),
                  
                  const SizedBox(height: 40),
                  
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => const HomeScreen()),
                      );
                    },
                    child: const Text("Log In", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                  
                  const SizedBox(height: 20),
                   Center(
                    child: TextButton(
                      onPressed: () {}, 
                      child: const Text("Bantuan ?", style: TextStyle(color: CeloeTheme.primaryColor))
                    )
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
             // Bottom wave decoration
            SizedBox(
              height: 100,
              width: double.infinity,
              child: CustomPaint(
                painter: WavePainter(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = CeloeTheme.primaryColor
      ..style = PaintingStyle.fill;

    var path = Path();
    path.moveTo(0, size.height);
    path.lineTo(0, size.height * 0.4);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.1, size.width * 0.5, size.height * 0.4);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.7, size.width, size.height * 0.2);
    path.lineTo(size.width, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
