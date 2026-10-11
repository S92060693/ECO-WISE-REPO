import 'package:flutter/material.dart';

import 'login_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  // ============================================================
  // COLORS
  // ============================================================

  final Color primaryGreen = const Color(0xFF073D36);
  final Color primaryYellow = const Color(0xFFFFB333);
  final Color cardBackgroundColor = const Color(0xFFECECEC);

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

    // ==========================================================
    // APP BAR
    // ==========================================================
    appBar: PreferredSize(
    preferredSize: const Size.fromHeight(70.0),

    child: AppBar(
        backgroundColor: primaryGreen,
        elevation: 0,
        automaticallyImplyLeading: false,
        titleSpacing: 16,

        title: Row(
        children: [
            Image.asset(
            'assets/images/eco_wise_white_logo.png',
            height: 38,
            fit: BoxFit.contain,

            errorBuilder: (context, error, stackTrace) {
                return RichText(
                text: TextSpan(
                    children: [
                    const TextSpan(
                        text: 'ECO ',
                        style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        ),
                    ),
                    TextSpan(
                        text: 'WISE',
                        style: TextStyle(
                        color: primaryYellow,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        ),
                    ),
                    ],
                ),
                );
            },
            ),
        ],
        ),

}