import 'dart:math';
import 'package:flutter/material.dart';

import 'resident_dashboard_screen.dart';
import 'truck_driver_dashboard_screen.dart';
import 'admin_dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {

  // ============================================================
  // CONTROLLERS
  // ============================================================

  final TextEditingController usernameController =
      TextEditingController();

  final TextEditingController passwordController =
      TextEditingController();
 // ============================================================
  // VARIABLES
  // ============================================================

  bool obscurePassword = true;

  bool isLoading = false;

  // ============================================================
  // LOADING ANIMATION CONTROLLER
  // ============================================================

  late AnimationController loadingController;

  // ============================================================
  // INIT STATE
  // ============================================================

  @override
  void initState() {
    super.initState();

    loadingController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
  }

  // ============================================================
  // DISPOSE
  // ============================================================

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();

    loadingController.dispose();

    super.dispose();
  }

  // ============================================================
  // LOGIN
  // ============================================================

  Future<void> login() async {
    // Prevent multiple clicks
    if (isLoading) {
      return;
    }

    final String username = usernameController.text.trim();
    final String password = passwordController.text.trim();

    // Empty validation
    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter username and password'),
        ),
      );
      return;
    }

    // Select dashboard based on login details
    Widget? dashboard;

    if (username == 'resident' && password == '1234') {
      dashboard = const DashboardScreen();
    } else if (username == 'truck' && password == '1234') {
      dashboard = const TruckDriverDashboardScreen();
    } else if (username == 'admin' && password == '1234') {
      dashboard = const AdminDashboardScreen();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid username or password'),
        ),
      );
      return;
    }

    // Start loading
    setState(() {
      isLoading = true;
    });

    loadingController.repeat();

    // Keep your existing 5-second loading time
    await Future.delayed(const Duration(seconds: 5));

    if (!mounted) {
      return;
    }

    // Stop loading
    loadingController.stop();

    // Navigate to the selected dashboard
    Navigator.pushReplacement(
      context,
      MaterialPageRoute<void>(
        builder: (context) => dashboard!,
      ),
    );
  }

  // ============================================================
  // FORGOT PASSWORD
  // ============================================================

  void forgotPassword() {
    if (isLoading) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Forgot Password selected',
        ),
      ),
    );
  }
  // ============================================================
  // SIGN UP
  // ============================================================

  void signUp() {
    if (isLoading) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Sign Up selected',
        ),
      ),
    );
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 19,
              ),
              child: Column(
                children: [
                  // ==================================================
                  // LOGO
                  // ==================================================

                  const SizedBox(height: 62),

                  Image.asset(
                    'assets/images/eco_wise_logo.png',

                    width: 265,
                    height: 175,

                    fit: BoxFit.contain,

                    errorBuilder: (
                      context,
                      error,
                      stackTrace,
                    ) {
                      return RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: 'ECO ',
                              style: TextStyle(
                                color: Color(0xFFFFB333),
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: 'WISE',
                              style: TextStyle(
                                color: Color(0xFF073D36),
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),

                  // ==================================================
                  // LOGIN TITLE
                  // ==================================================

                  const SizedBox(height: 25),

                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),

                  // ==================================================
                  // SPACE
                  // ==================================================

                  const SizedBox(height: 66),

                  // ==================================================
                  // USERNAME
                  // ==================================================

                  SizedBox(
                    height: 51,
                    child: TextField(
                      controller: usernameController,

                      enabled: !isLoading,

                      keyboardType:
                          TextInputType.text,

                      textInputAction:
                          TextInputAction.next,

                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),

                      decoration: InputDecoration(
                        hintText: 'Username',

                        hintStyle:
                            const TextStyle(
                          fontSize: 18,
                          color: Color(0xFF888888),
                        ),

                        contentPadding:
                            const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 0,
                        ),

                        filled: true,

                        fillColor: Colors.white,

                        border:
                            OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(
                            10,
                          ),

                          borderSide:
                              const BorderSide(
                            color: Color(0xFF073D36),
                            width: 1.5,
                          ),
                        ),

                        enabledBorder:
                            OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(
                            10,
                          ),

                          borderSide:
                              const BorderSide(
                            color: Color(0xFF073D36),
                            width: 1.5,
                          ),
                        ),

                        focusedBorder:
                            OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(
                            10,
                          ),

                          borderSide:
                              const BorderSide(
                            color: Color(0xFF073D36),
                            width: 1.8,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // ==================================================
                  // SPACE
                  // ==================================================

                  const SizedBox(height: 11),

                  // ==================================================
                  // PASSWORD
                  // ==================================================

                  SizedBox(
                    height: 51,
                    child: TextField(
                      controller: passwordController,

                      enabled: !isLoading,

                      obscureText:
                          obscurePassword,

                      textInputAction:
                          TextInputAction.done,

                      onSubmitted: (_) {
                        login();
                      },

                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),

                      decoration: InputDecoration(
                        hintText: 'Password',

                        hintStyle:
                            const TextStyle(
                          fontSize: 18,
                          color: Color(0xFF888888),
                        ),

                        contentPadding:
                            const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 0,
                        ),

                        filled: true,

                        fillColor: Colors.white,

                        border:
                            OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(
                            10,
                          ),

                          borderSide:
                              const BorderSide(
                            color: Color(0xFF073D36),
                            width: 1.5,
                          ),
                        ),

                        enabledBorder:
                            OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(
                            10,
                          ),

                          borderSide:
                              const BorderSide(
                            color: Color(0xFF073D36),
                            width: 1.5,
                          ),
                        ),

                        focusedBorder:
                            OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(
                            10,
                          ),

                          borderSide:
                              const BorderSide(
                            color: Color(0xFF073D36),
                            width: 1.8,
                          ),
                        ),

                        suffixIcon:
                            IconButton(
                          onPressed:
                              isLoading
                                  ? null
                                  : () {
                                      setState(() {
                                        obscurePassword =
                                            !obscurePassword;
                                      });
                                    },

                          icon: Icon(
                            obscurePassword
                                ? Icons
                                    .visibility_off
                                : Icons.visibility,

                            size: 20,

                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // ==================================================
                  // FORGOT PASSWORD
                  // ==================================================

                  Align(
                    alignment:
                        Alignment.centerRight,

                    child: GestureDetector(
                      onTap: forgotPassword,

                      child: const Padding(
                        padding: EdgeInsets.only(
                          top: 5,
                          right: 20,
                        ),

                        child: Text(
                          'Forget Password',

                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // ==================================================
                  // LOGIN BUTTON
                  // ==================================================

                  const SizedBox(height: 16),

                  SizedBox(
                    width: double.infinity,

                    height: 51,

                    child: ElevatedButton(
                      onPressed:
                          isLoading
                              ? null
                              : login,

                      style:
                          ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color(0xFF073D36),

                        disabledBackgroundColor:
                            const Color(0xFF073D36),

                        foregroundColor:
                            const Color(0xFFFFB333),

                        disabledForegroundColor:
                            Colors.white,

                        elevation: 0,

                        shape:
                            RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(
                            9,
                          ),
                        ),
                      ),

                      child:
                          isLoading
                              ? const LoadingDots()
                              : const Text(
                                  'Login',

                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight:
                                        FontWeight.w600,
                                  ),
                                ),
                    ),
                  ),

                  // ==================================================
                  // OR
                  // ==================================================

                  const SizedBox(height: 14),

                  Row(
                    children: [
                      const Expanded(
                        child: Divider(
                          color: Colors.black,
                          thickness: 1.2,
                        ),
                      ),

                      const Padding(
                        padding:
                            EdgeInsets.symmetric(
                          horizontal: 7,
                        ),

                        child: Text(
                          'OR',

                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ),

                      const Expanded(
                        child: Divider(
                          color: Colors.black,
                          thickness: 1.2,
                        ),
                      ),
                    ],
                  ),

                  // ==================================================
                  // SIGN UP BUTTON
                  // ==================================================

                  const SizedBox(height: 13),

                  SizedBox(
                    width: double.infinity,

                    height: 51,

                    child: ElevatedButton(
                      onPressed:
                          isLoading
                              ? null
                              : signUp,

                      style:
                          ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color(0xFFFFB333),

                        disabledBackgroundColor:
                            const Color(0xFFFFB333),

                        foregroundColor:
                            Colors.black,

                        disabledForegroundColor:
                            Colors.black,

                        elevation: 0,

                        shape:
                            RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(
                            9,
                          ),
                        ),
                      ),

                      child: const Text(
                        'Sign Up',

                        style: TextStyle(
                          fontSize: 18,
                          fontWeight:
                              FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ================================================================
// 4 DOT ROTATING LOADING ANIMATION
// ================================================================

class LoadingDots extends StatefulWidget {
  const LoadingDots({super.key});

  @override
  State<LoadingDots> createState() =>
      _LoadingDotsState();
}

class _LoadingDotsState extends State<LoadingDots>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,

      duration: const Duration(
        milliseconds: 900,
      ),
    )..repeat();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 28,
      height: 28,

      child: AnimatedBuilder(
        animation: controller,

        builder: (context, child) {
          return CustomPaint(
            painter: LoadingDotsPainter(
              controller.value,
            ),
          );
        },
      ),
    );
  }
}

// ================================================================
// LOADING DOTS PAINTER
// ================================================================

class LoadingDotsPainter extends CustomPainter {
  final double progress;

  LoadingDotsPainter(this.progress);

  @override
  void paint(
    Canvas canvas,
    Size size,
  ) {
    final Paint paint = Paint()
      ..color = const Color(0xFFFFB333)
      ..style = PaintingStyle.fill;

    final double centerX =
        size.width / 2;

    final double centerY =
        size.height / 2;

    // Distance from center
    const double radius = 8;

    // Four dots
    const int dotCount = 4;

    for (int i = 0; i < dotCount; i++) {
      // Each dot is 90 degrees apart
      final double angle =
          (2 * pi / dotCount) * i +
          (progress * 2 * pi);

      final double x =
          centerX + cos(angle) * radius;

      final double y =
          centerY + sin(angle) * radius;

      // Slightly smaller dots
      canvas.drawCircle(
        Offset(x, y),
        2.3,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(
    covariant LoadingDotsPainter oldDelegate,
  ) {
    return oldDelegate.progress != progress;
  }
}