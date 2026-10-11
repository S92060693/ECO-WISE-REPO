import 'package:flutter/material.dart';

import 'login_screen.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  State<AdminDashboardScreen> createState() =>
      _AdminDashboardScreenState();
}

class _AdminDashboardScreenState
    extends State<AdminDashboardScreen> {

  // ============================================================
  // COLORS
  // ============================================================

  final Color primaryGreen = const Color(0xFF073D36);
  final Color primaryYellow = const Color(0xFFFFB333);
  final Color cardBackgroundColor = const Color(0xFFECECEC);

  // ============================================================
  // SELECTED BOTTOM NAVIGATION
  // ============================================================

  int selectedBottomNavIndex = 0;

  // ============================================================
  // BOTTOM NAVIGATION
  // ============================================================

  void onBottomNavigationTap(int index) {
    setState(() {
      selectedBottomNavIndex = index;
    });
  }

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

      // ==========================================================
      // BOTTOM NAVIGATION BAR
      // ==========================================================
      bottomNavigationBar: Container(
        height: 82,

        margin: const EdgeInsets.only(left: 12, right: 12, bottom: 20),

        decoration: BoxDecoration(
          color: primaryGreen,

          borderRadius: BorderRadius.circular(18),
        ),

        child: ClipRRect(
          borderRadius: BorderRadius.circular(18),

          child: BottomNavigationBar(
            currentIndex: selectedBottomNavIndex,

            onTap: onBottomNavigationTap,

            backgroundColor: primaryGreen,

            type: BottomNavigationBarType.fixed,

            selectedItemColor: primaryYellow,

            unselectedItemColor: Colors.white,

            iconSize: 32,

            selectedLabelStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),

            unselectedLabelStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),

            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),

              BottomNavigationBarItem(
                icon: Icon(Icons.directions_bus_outlined),
                label: 'Live Map',
              ),

              BottomNavigationBarItem(
                icon: Icon(Icons.show_chart_rounded),
                label: 'Activities',
              ),

              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline_rounded),
                label: 'Account',
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ============================================================
  // SELECT SCREEN
  // ============================================================

  Widget _buildSelectedScreen() {
    switch (selectedBottomNavIndex) {
      case 0:
        return _buildHomeScreen();

      case 1:
        return _buildLiveMapScreen();

      case 2:
        return _buildActivitiesScreen();

      case 3:
        return _buildAccountScreen();

      default:
        return _buildHomeScreen();
    }
  }

  // ============================================================
  // HOME SCREEN
  // ============================================================

  Widget _buildHomeScreen() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),

      
    );
  }

  // ============================================================
  // LIVE MAP SCREEN
  // ============================================================

  Widget _buildLiveMapScreen() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Icon(Icons.map_outlined, size: 80, color: primaryGreen),

          const SizedBox(height: 16),

          const Text(
            'Live Map',

            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            'Track garbage collection vehicles\nin real time.',

            textAlign: TextAlign.center,

            style: TextStyle(fontSize: 15, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // ACTIVITIES SCREEN
  // ============================================================

  Widget _buildActivitiesScreen() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          const Text(
            'Activities',

            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),

          const SizedBox(height: 20),

          _activityCard(
            icon: Icons.delete_outline,
            title: 'Garbage Collection',
            subtitle: 'Organic waste collection request',
            date: 'Today, 10:30 AM',
          ),

          const SizedBox(height: 12),

          _activityCard(
            icon: Icons.local_shipping_outlined,
            title: 'Collection Scheduled',
            subtitle: 'Truck scheduled for tomorrow',
            date: 'Yesterday, 4:20 PM',
          ),

          const SizedBox(height: 12),

          _activityCard(
            icon: Icons.check_circle_outline,
            title: 'Request Completed',
            subtitle: 'Plastic waste collected',
            date: '12 Oct 2026',
          ),
        ],
      ),
    );
  }

  // ============================================================
  // ACTIVITY CARD
  // ============================================================

  Widget _activityCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required String date,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: cardBackgroundColor,

        borderRadius: BorderRadius.circular(12),
      ),

      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,

            decoration: BoxDecoration(
              color: primaryGreen,

              borderRadius: BorderRadius.circular(12),
            ),

            child: Icon(icon, color: primaryYellow, size: 28),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  title,

                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  subtitle,

                  style: const TextStyle(fontSize: 13, color: Colors.black54),
                ),

                const SizedBox(height: 4),

                Text(
                  date,

                  style: const TextStyle(fontSize: 11, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // ACCOUNT SCREEN
  // ============================================================

  Widget _buildAccountScreen() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),

      child: Column(
        children: [
          // ======================================================
          // PROFILE
          // ======================================================

          const SizedBox(height: 20),

          CircleAvatar(
            radius: 50,

            backgroundColor: cardBackgroundColor,

            child: Icon(Icons.person, size: 60, color: primaryGreen),
          ),

          const SizedBox(height: 15),

          const Text(
            'Admin',

            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 5),

          const Text(
            'admin',

            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),

          const SizedBox(height: 30),

          // ======================================================
          // ACCOUNT OPTIONS
          // ======================================================
          _accountOption(icon: Icons.person_outline, title: 'My Profile'),

          _accountOption(
            icon: Icons.notifications_none,
            title: 'Notifications',
          ),

          _accountOption(icon: Icons.settings_outlined, title: 'Settings'),

          _accountOption(icon: Icons.help_outline, title: 'Help & Support'),

          _accountOption(icon: Icons.logout, title: 'Logout', isLogout: true),
        ],
      ),
    );
  }

  // ============================================================
  // ACCOUNT OPTION
  // ============================================================

  Widget _accountOption({
    required IconData icon,
    required String title,
    bool isLogout = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),

      decoration: BoxDecoration(
        color: cardBackgroundColor,

        borderRadius: BorderRadius.circular(12),
      ),

      child: ListTile(
        leading: Icon(icon, color: isLogout ? Colors.red : primaryGreen),

        title: Text(
          title,

          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,

            color: isLogout ? Colors.red : Colors.black,
          ),
        ),

        trailing: Icon(Icons.chevron_right, color: Colors.grey.shade600),

        onTap: () {
          // ========================================================
          // LOGOUT
          // ========================================================

          if (isLogout) {
            showDialog(
              context: context,

              barrierDismissible: false,

              builder: (BuildContext dialogContext) {
                return AlertDialog(
                  backgroundColor: Colors.white,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),

                  title: const Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF073D36),
                    ),
                  ),

                  content: const Text(
                    'Are you sure you want to logout from ECO WISE?',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black87,
                      height: 1.4,
                    ),
                  ),

                  actionsPadding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: 14,
                  ),

                  actions: [
                    // ==============================================
                    // CANCEL BUTTON
                    // ==============================================

                    TextButton(
                      onPressed: () {
                        Navigator.pop(dialogContext);
                      },

                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          color: Color(0xFF073D36),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    // ==============================================
                    // YES BUTTON
                    // ==============================================
                    ElevatedButton(
                      onPressed: () {
                        // Close confirmation dialog
                        Navigator.pop(dialogContext);

                        // Go to Login Screen
                        Navigator.pushAndRemoveUntil(
                          context,

                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),

                          // Remove Dashboard and all previous screens
                          (route) => false,
                        );
                      },

                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF073D36),

                        foregroundColor: const Color(0xFFFFB333),

                        elevation: 0,

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),

                      child: const Text(
                        'Yes',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                );
              },
            );
          }
          // ========================================================
          // OTHER ACCOUNT OPTIONS
          // ========================================================
          else {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('$title selected')));
          }
        },
      ),
    );
  }
}