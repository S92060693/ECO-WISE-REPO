import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {

  // ============================================================
  // ANIMATION CONTROLLER
  // ============================================================

  late AnimationController _animationController;

  // ============================================================
  // SPLASH TIMER
  // ============================================================

  Timer? _splashTimer;

  // ============================================================
  // INIT STATE
  // ============================================================

  @override
  void initState() {
    super.initState();

    // Animation for the 5 circles
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();

    // After 15 seconds → Login Screen
    _splashTimer = Timer(
      const Duration(seconds: 15),
      () {
        if (!mounted) return;

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      },
    );
  }

  // ============================================================
  // DISPOSE
  // ============================================================

  @override
  void dispose() {
    _splashTimer?.cancel();
    _animationController.dispose();

    super.dispose();
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),

      body: SafeArea(
        child: Center(
          child: AnimatedBuilder(
            animation: _animationController,

            builder: (context, child) {
              return Stack(
                alignment: Alignment.center,

                children: [

                  // ==================================================
                  // ECO WISE LOGO
                  // ==================================================

                  Transform.translate(
                    offset: const Offset(0, -25),

                    child: Image.asset(
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
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              TextSpan(
                                text: 'WISE',
                                style: TextStyle(
                                  color: Color(0xFF073D36),
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),

                  // ==================================================
                  // 5 ANIMATED CIRCLES
                  // ==================================================

                  Transform.translate(
                    offset: const Offset(0, 78),

                    child: const _LoadingDots(),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

// ================================================================
// LOADING DOTS
// ================================================================

class _LoadingDots extends StatelessWidget {
  const _LoadingDots();

  @override
  Widget build(BuildContext context) {
    return const _AnimatedDots();
  }
}

// ================================================================
// ANIMATED DOTS STATEFUL WIDGET
// ================================================================

class _AnimatedDots extends StatefulWidget {
  const _AnimatedDots();

  @override
  State<_AnimatedDots> createState() => _AnimatedDotsState();
}

class _AnimatedDotsState extends State<_AnimatedDots>
    with SingleTickerProviderStateMixin {

  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  // ============================================================
  // DOT POSITION
  // ============================================================

  double getDotPosition(
    double progress,
    int index,
  ) {
    // Distance between each dot's animation
    const double delay = 0.20;

    // Create a different phase for every dot
    double phase =
        (progress - (index * delay)) % 1.0;

    // Smooth up/down movement
    double movement =
        sin(phase * 2 * pi);

    // Maximum movement
    return -movement * 7;
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,

      builder: (context, child) {
        return Row(
          mainAxisSize: MainAxisSize.min,

          children: List.generate(
            5,
            (index) {

              // ==================================================
              // DOT COLOR
              // ==================================================

              Color dotColor;

              // Pattern:
              // Green - Orange - Green - Orange - Green

              if (index == 1 || index == 3) {
                dotColor = const Color(0xFFFFB333);
              } else {
                dotColor = const Color(0xFF073D36);
              }

              // ==================================================
              // DOT MOVEMENT
              // ==================================================

              double verticalPosition =
                  getDotPosition(
                controller.value,
                index,
              );

              return Transform.translate(
                offset: Offset(
                  0,
                  verticalPosition,
                ),

                child: Container(
                  width: 10,
                  height: 10,

                  margin: const EdgeInsets.symmetric(
                    horizontal: 3,
                  ),

                  decoration: BoxDecoration(
                    color: dotColor,
                    shape: BoxShape.circle,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}