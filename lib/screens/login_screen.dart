import 'package:celoe/providers/app_state.dart';
import 'package:celoe/screens/help_screen.dart';
import 'package:celoe/screens/home_screen.dart';
import 'package:celoe/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Stack(
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
                         width: 100,
                         height: 100,
                         decoration: BoxDecoration(
                           color: Colors.white,
                           shape: BoxShape.circle,
                           boxShadow: [
                             BoxShadow(
                               color: Colors.black.withValues(alpha: 0.1),
                               blurRadius: 10,
                               offset: const Offset(0, 4),
                             )
                           ]
                         ),
                         child: Padding(
                           padding: const EdgeInsets.all(8),
                           child: Image.asset(
                             'assets/images/logo.png',
                             fit: BoxFit.contain,
                             errorBuilder: (context, error, stackTrace) {
                               // Fallback ke icon jika logo tidak ditemukan
                               return Container(
                                 decoration: const BoxDecoration(
                                   color: CeloeTheme.primaryColor,
                                   shape: BoxShape.circle
                                 ),
                                 child: const Icon(Icons.school, color: Colors.white, size: 50),
                               );
                             },
                           ),
                         ),
                       ),
                     ),
                   )
                ],
              ),
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
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 2),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 2),
                        ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email tidak boleh kosong';
                      }
                      if (!value.contains('@')) {
                        return 'Format email tidak valid';
                      }
                      return null;
                    },
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
                   TextFormField(
                     controller: _passwordController,
                     obscureText: _obscurePassword,
                    decoration: const InputDecoration(
                         enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 2),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 2),
                        ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password tidak boleh kosong';
                      }
                      if (value.length < 6) {
                        return 'Password minimal 6 karakter';
                      }
                      return null;
                    },
                  ),
                  
                  const SizedBox(height: 40),
                  
                  ElevatedButton(
                    onPressed: _isLoading ? null : _handleLogin,
                    child: _isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          )
                        : const Text("Log In", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                  
                  const SizedBox(height: 20),
                   Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const HelpScreen()),
                        );
                      }, 
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

  Future<void> _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      // Simulasi delay login
      await Future.delayed(const Duration(seconds: 1));

      if (mounted) {
        final appState = Provider.of<AppState>(context, listen: false);
        await appState.login(_emailController.text, _passwordController.text);

        if (mounted) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        }
      }

      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
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
