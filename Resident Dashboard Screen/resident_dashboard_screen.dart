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
    // DISPOSE
    // ============================================================

    @override
    void dispose() {
        searchController.dispose();
        super.dispose();
    }

    // ============================================================
    // ACTION HANDLERS
    // ============================================================

  void onNewInquiry() {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('New Inquiry selected')));
  }

  void onComplain() {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Complain selected')));
  }

    void onMoreDetails() {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('More details selected')));
  }

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

    // ============================================================
  // HOME SCREEN
  // ============================================================

  Widget _buildHomeScreen() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),

      child: Column(
        children: [
          // ======================================================
          // CATEGORIES GRID
          // ======================================================

          // ======================================================
          // SEARCH BAR
          // ======================================================
          SizedBox(
            height: 48,

            child: TextField(
              controller: searchController,

              style: const TextStyle(fontSize: 16, color: Colors.black),

              decoration: InputDecoration(
                hintText: 'Search...',

                hintStyle: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFFB0B0B0),
                ),

                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 0,
                ),

                filled: true,

                fillColor: Colors.white,

                suffixIcon: const Icon(
                  Icons.search,

                  color: Color(0xFFB0B0B0),

                  size: 24,
                ),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),

                  borderSide: const BorderSide(
                    color: Color(0xFFD0D0D0),

                    width: 1.2,
                  ),
                ),

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),

                  borderSide: const BorderSide(
                    color: Color(0xFFD0D0D0),

                    width: 1.2,
                  ),
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),

                  borderSide: BorderSide(color: primaryGreen, width: 1.5),
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // ======================================================
          // ACTION BUTTONS
          // ======================================================
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 68,

                  child: ElevatedButton.icon(
                    onPressed: onNewInquiry,

                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryYellow,

                      foregroundColor: Colors.black,

                      elevation: 0,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),

                    icon: const Icon(Icons.add, size: 25, color: Colors.black),

                    label: const Text(
                      'New Inquiry',

                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: SizedBox(
                  height: 68,

                  child: ElevatedButton.icon(
                    onPressed: onComplain,

                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryYellow,

                      foregroundColor: Colors.black,

                      elevation: 0,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),

                    icon: const Icon(
                      Icons.error_outline,
                      size: 25,
                      color: Colors.black,
                    ),

                    label: const Text(
                      'Complain',

                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

            // ======================================================
          // BANNER 1
          // ======================================================
          
          Container(
            decoration: BoxDecoration(
              color: cardBackgroundColor,

              borderRadius: BorderRadius.circular(12),
            ),

            clipBehavior: Clip.antiAlias,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,

              children: [
                // ================================================
                // BANNER IMAGE
                // ================================================

                SizedBox(
                  height: 165,

                  child: Stack(
                    fit: StackFit.expand,

                    children: [
                      Image.asset(
                        'assets/images/banner_bg.png',

                        fit: BoxFit.cover,

                        errorBuilder: (context, error, stackTrace) {
                          return Container(color: Colors.black);
                        },
                      ),

                      Container(color: Colors.black.withValues(alpha: 0.4)),

                      Padding(
                        padding: const EdgeInsets.all(16),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            Text(
                              "DON'T SET ON FIRE",

                              style: TextStyle(
                                color: primaryYellow,

                                fontSize: 18,

                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 3),

                            const Text(
                              'WE WILL COME AND PICK UP THE TRASH',

                              style: TextStyle(
                                color: Colors.white,

                                fontSize: 12,

                                fontWeight: FontWeight.w500,

                                letterSpacing: 0.5,
                              ),
                            ),

                            const SizedBox(height: 8),

                            Image.asset(
                              'assets/images/eco_wise_white_logo.png',

                              height: 32,

                              fit: BoxFit.contain,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // ================================================
                // DESCRIPTION
                // ================================================
                Padding(
                  padding: const EdgeInsets.all(12),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,

                    children: [
                      const Text(
                        'Burning waste pollutes the air and harms our health. Dispose of garbage safely and keep our environment clean.',

                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black87,
                          height: 1.35,
                        ),
                      ),

                      const SizedBox(height: 10),

                      SizedBox(
                        height: 36,

                        child: ElevatedButton(
                          onPressed: onMoreDetails,

                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryGreen,

                            foregroundColor: Colors.white,

                            elevation: 0,

                            padding: const EdgeInsets.symmetric(horizontal: 16),

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),

                          child: const Row(
                            mainAxisSize: MainAxisSize.min,

                            children: [
                              Text(
                                'More',

                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),

                              SizedBox(width: 4),

                              Icon(
                                Icons.north_east,

                                size: 14,

                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // SPACE BETWEEN BANNER 1 AND BANNER 2
          const SizedBox(height: 20),
        ]
        
      )
    )
  }
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
            'Resident',

            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 5),

          const Text(
            'resident',

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