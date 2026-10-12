import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  // ============================================================
  // ECO WISE COLORS
  // ============================================================

  static const Color primaryGreen = Color(0xFF0B302A);
  static const Color primaryYellow = Color(0xFFFFB333);
  static const Color backgroundColor = Color(0xFFEEEEEE);
  static const Color unselectedColor = Color(0xFFD9D9D9);



  // ============================================================
  // ECO WISE LOGO
  // ============================================================

  Widget _buildLogo({double fontSize = 38}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
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
      ],
    );
  }





}