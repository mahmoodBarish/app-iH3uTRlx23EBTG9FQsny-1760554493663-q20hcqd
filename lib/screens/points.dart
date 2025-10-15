import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class Points extends StatefulWidget {
  const Points({super.key});

  @override
  State<Points> createState() => _PointsState();
}

class _PointsState extends State<Points> {
  int _selectedTabIndex = 0;

  final List<_UserRankData> _userRanks = [
    _UserRankData(
        rank: '1',
        name: 'Ali Khan',
        points: '2,569 points',
        avatarAsset: 'assets/images/9_4446.png',
        medalColor: const Color(0xFFFFD54B),
        isTopRank: true),
    _UserRankData(
        rank: '2',
        name: 'Alena Ali',
        points: '1,469 points',
        avatarAsset: 'assets/images/9_4459.png',
        medalColor: const Color(0xFFE1E1E2),
        isTopRank: true),
    _UserRankData(
        rank: '3',
        name: 'Ali Khan',
        points: '1,053 points',
        avatarAsset: 'assets/images/9_4472.png',
        medalColor: const Color(0xFFF6B191),
        isTopRank: true),
    _UserRankData(
        rank: '4',
        name: 'Zain Asif',
        points: '590 points',
        avatarAsset: 'assets/images/9_4482.png'),
    _UserRankData(
        rank: '5',
        name: 'Waqas Shabeer',
        points: '448 points',
        avatarAsset: 'assets/images/9_4489.png'),
    _UserRankData(
        rank: '6',
        name: 'Skylar Geidt',
        points: '448 points',
        avatarAsset: 'assets/images/9_4502.png'),
    _UserRankData(
        rank: '7',
        name: 'Justin Bator',
        points: '448 points',
        avatarAsset: 'assets/images/9_4512.png'),
    _UserRankData(
        rank: '8',
        name: 'Cooper Lipshutz',
        points: '448 points',
        avatarAsset: 'assets/images/9_4522.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2761FF),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            _buildHeader(),
            _buildSegmentedControl(),
            const SizedBox(height: 24),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                  child: ListView.separated(
                    padding: const EdgeInsets.fromLTRB(16, 24, 16, 100),
                    itemCount: _userRanks.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      return _UserRankCard(data: _userRanks[index]);
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Text(
        'Points',
        style: GoogleFonts.rubik(
          fontWeight: FontWeight.w600,
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildSegmentedControl() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            _buildTabItem('Weekly', 0),
            _buildTabItem('All Time', 1),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem(String text, int index) {
    bool isSelected = _selectedTabIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedTabIndex = index;
          });
        },
        child: Container(
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF2761FF) : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              text,
              style: GoogleFonts.rubik(
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    final String currentRoute = GoRouterState.of(context).uri.toString();

    return Container(
      height: 83,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 12,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.home_outlined, currentRoute == '/1_home',
              () => context.go('/1_home')),
          _buildNavItem(Icons.bar_chart, currentRoute == '/points',
              () => context.go('/points')),
          _buildNavItem(Icons.people_outline, currentRoute == '/followers',
              () => context.go('/followers')),
          _buildNavItem(Icons.person_outline, currentRoute == '/profile',
              () => context.go('/profile')),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, bool isActive, VoidCallback onTap) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(
        icon,
        color: isActive ? const Color(0xFF2761FF) : const Color(0xFFA9B1BF),
        size: 28,
      ),
    );
  }
}

class _UserRankData {
  final String rank;
  final String name;
  final String points;
  final String avatarAsset;
  final Color? medalColor;
  final bool isTopRank;

  _UserRankData({
    required this.rank,
    required this.name,
    required this.points,
    required this.avatarAsset,
    this.medalColor,
    this.isTopRank = false,
  });
}

class _UserRankCard extends StatelessWidget {
  final _UserRankData data;

  const _UserRankCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 30,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFFEDEDED), width: 1.5),
            ),
            child: Center(
              child: Text(
                data.rank,
                style: GoogleFonts.rubik(
                  color: const Color(0xFF858494),
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          CircleAvatar(
            radius: 28,
            backgroundImage: AssetImage(data.avatarAsset),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.name,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: const Color(0xFF2E2E2E),
                  ),
                ),
                Text(
                  data.points,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: const Color(0xFF858494),
                  ),
                ),
              ],
            ),
          ),
          if (data.isTopRank)
            Stack(
              alignment: Alignment.center,
              children: [
                Icon(
                  Icons.star,
                  color: data.medalColor,
                  size: 40,
                ),
                const Icon(
                  Icons.emoji_events,
                  color: Colors.white,
                  size: 18,
                ),
              ],
            ),
        ],
      ),
    );
  }
}