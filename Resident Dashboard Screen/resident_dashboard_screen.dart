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
  // CATEGORIES DATA
  // ============================================================

  final List<Map<String, String>> categories = [
    {'title': 'Organic', 'iconPath': 'assets/images/organic.png'},
    {'title': 'Paper', 'iconPath': 'assets/images/paper.png'},
    {'title': 'Plastic', 'iconPath': 'assets/images/plastic.png'},
    {'title': 'Glass', 'iconPath': 'assets/images/glass.png'},
    {'title': 'Metal', 'iconPath': 'assets/images/metal.png'},
    {'title': 'Electronic', 'iconPath': 'assets/images/electronic.png'},
    {'title': 'Textile', 'iconPath': 'assets/images/textile.png'},
    {'title': 'Hazardous', 'iconPath': 'assets/images/hazardous.png'},
  ];


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

        actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.face, color: Colors.white, size: 26),
            ),

            Stack(
              alignment: Alignment.center,

              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications_none_rounded,
                    color: Colors.white,
                    size: 26,
                  ),
                ),

                Positioned(
                  top: 12,
                  right: 12,

                  child: Container(
                    width: 9,
                    height: 9,

                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(width: 8),
        ],
        ),
    ),

    // ==========================================================
      // BODY
      // ==========================================================
      body: SafeArea(child: _buildSelectedScreen()),

}