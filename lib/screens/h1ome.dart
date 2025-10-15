import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package.go_router/go_router.dart';

class H1ome extends StatelessWidget {
  const H1ome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                _buildHeader(),
                const SizedBox(height: 24),
                _buildSearchBar(),
                const SizedBox(height: 24),
                _buildPromoBanner(context),
                const SizedBox(height: 16),
                _buildCarouselIndicator(),
                const SizedBox(height: 24),
                _buildCategoryList(),
                const SizedBox(height: 24),
                _buildStoresHeader(context),
                const SizedBox(height: 16),
                _buildStoreList(context),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Hi, Murat doe',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF2E2E2E),
                  ),
                ),
                const SizedBox(width: 8),
                Image.asset(
                  'assets/images/9_4182.png',
                  width: 17,
                  height: 17,
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              'Want to get some coupon?',
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF999999),
              ),
            ),
          ],
        ),
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFF2761FF), width: 2),
            image: const DecorationImage(
              image: AssetImage('assets/images/9_4174.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 30,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: GoogleFonts.poppins(
            fontSize: 14,
            color: const Color(0xFF999999),
          ),
          prefixIcon: const Icon(Icons.search, color: Color(0xFF2E2E2E)),
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        ),
      ),
    );
  }

  Widget _buildPromoBanner(BuildContext context) {
    return Container(
      height: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [Color(0xFF5582FF), Color(0xFF2761FF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -20,
            bottom: -20,
            child: Image.asset(
              'assets/images/9_4756.png',
              width: 170,
              height: 170,
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Discount upto 50%',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: Text(
                    'Explore it and share it with your loved ones',
                    style: GoogleFonts.dmSans(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () => context.go('/1_home'),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'Explore Now',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF2761FF),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCarouselIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 23,
          height: 6,
          decoration: BoxDecoration(
            color: const Color(0xFF2761FF),
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        const SizedBox(width: 4),
        Container(
          width: 6,
          height: 6,
          decoration: const BoxDecoration(
            color: Color(0xFFEDEDED),
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 4),
        Container(
          width: 6,
          height: 6,
          decoration: const BoxDecoration(
            color: Color(0xFFEDEDED),
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryList() {
    final categories = [
      {'icon': 'assets/images/9_4202.png', 'label': 'All', 'color': const Color(0xFF2761FF)},
      {'icon': 'assets/images/9_4219.png', 'label': 'Delivery', 'color': Colors.transparent},
      {'icon': 'assets/images/9_4237.png', 'label': 'Restaurant', 'color': Colors.transparent},
      {'icon': 'assets/images/9_4272.png', 'label': 'Fashion', 'color': Colors.transparent},
      {'icon': 'assets/images/9_4342.png', 'label': 'Electronics', 'color': Colors.transparent},
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((category) {
          final bool isSelected = category['label'] == 'All';
          return Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Column(
              children: [
                Container(
                  width: 58,
                  height: 58,
                  decoration: BoxDecoration(
                    color: category['color'] as Color,
                    shape: BoxShape.circle,
                    border: category['color'] == Colors.transparent ? Border.all(color: const Color(0xFFEDEDED)) : null,
                  ),
                  child: Center(
                    child: Image.asset(
                      category['icon'] as String,
                      width: 28,
                      height: 28,
                      color: isSelected ? Colors.white : null,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  category['label'] as String,
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: isSelected ? const Color(0xFF2761FF) : const Color(0xFF061023).withOpacity(0.93),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildStoresHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Stores',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF061023).withOpacity(0.93),
          ),
        ),
        GestureDetector(
          onTap: () => context.go('/points'),
          child: Text(
            '639 stores',
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF2761FF),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStoreList(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) => _StoreCard(
        onFollow: () => context.go('/followers'),
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
          _buildBottomNavItem(
              context: context,
              icon: Icons.home,
              label: 'Home',
              route: '/1_home',
              isActive: currentRoute == '/1_home'),
          _buildBottomNavItem(
              context: context,
              icon: Icons.bar_chart_outlined,
              label: 'Favorite',
              route: '/points',
              isActive: currentRoute == '/points'),
          _buildBottomNavItem(
              context: context,
              icon: Icons.group_outlined,
              label: 'Clients',
              route: '/followers',
              isActive: currentRoute == '/followers'),
          _buildBottomNavItem(
              context: context,
              icon: Icons.person_outline,
              label: 'Profile',
              route: '/profile',
              isActive: currentRoute == '/profile'),
        ],
      ),
    );
  }

  Widget _buildBottomNavItem({
    required BuildContext context,
    required IconData icon,
    required String label,
    required String route,
    required bool isActive,
  }) {
    return GestureDetector(
      onTap: () => context.go(route),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isActive ? const Color(0xFF2761FF) : const Color(0xFF6B7280),
            size: 24,
          ),
          if (isActive) ...[
            const SizedBox(height: 4),
            Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF2761FF),
              ),
            ),
          ]
        ],
      ),
    );
  }
}

class _StoreCard extends StatelessWidget {
  final VoidCallback onFollow;
  const _StoreCard({required this.onFollow});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
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
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/9_4390.png',
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 5,
                right: 5,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.8),
                  ),
                  child: const Icon(Icons.favorite, color: Color(0xFF2761FF), size: 12),
                ),
              ),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: SizedBox(
              height: 80,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Store Name',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF2E2E2E),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                        style: GoogleFonts.poppins(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF858495),
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: onFollow,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2761FF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 0),
                          minimumSize: const Size(64, 24),
                        ),
                        child: Text(
                          'Follow',
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.more_horiz, color: Color(0xFF2E2E2E)),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}