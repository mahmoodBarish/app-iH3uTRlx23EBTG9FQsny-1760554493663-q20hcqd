import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class Followers extends StatelessWidget {
  const Followers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF252525)),
          onPressed: () => context.pop(),
        ),
        title: Text(
          'Followers',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF252525),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              _buildSectionHeader(context, 'My Followers'),
              const SizedBox(height: 12),
              _buildMyFollowersList(),
              const SizedBox(height: 24),
              _buildSectionHeader(context, 'Follower Request'),
              const SizedBox(height: 12),
              _buildFollowerRequestList(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF252525),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'See more',
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

  Widget _buildMyFollowersList() {
    return Column(
      children: [
        _buildFollowerItem(
          imageAsset: 'assets/images/9_4684.png',
          name: 'Olivia Thompson',
          username: '@oliviathompson',
          isRemove: true,
        ),
        const SizedBox(height: 16),
        _buildFollowerItem(
          imageAsset: 'assets/images/9_4698.png',
          name: 'Ethan Baker',
          username: '@ethan_baker',
          isRemove: true,
        ),
        const SizedBox(height: 16),
        _buildFollowerItem(
          imageAsset: 'assets/images/9_4712.png',
          name: 'Chloe Mitchell',
          username: '@Mitch_Chloe',
          isRemove: true,
        ),
      ],
    );
  }

  Widget _buildFollowerRequestList() {
    return Column(
      children: [
        _buildFollowerItem(
          imageAsset: 'assets/images/9_4731.png',
          name: 'James Carter',
          username: '@Bigjamescarter',
          isRemove: false,
        ),
        const SizedBox(height: 16),
        _buildFollowerItem(
          imageAsset: 'assets/images/9_4745.png',
          name: 'Ava Wilson',
          username: '@Avawilson_',
          isRemove: false,
        ),
      ],
    );
  }

  Widget _buildFollowerItem({
    required String imageAsset,
    required String name,
    required String username,
    required bool isRemove,
  }) {
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
          Container(
            width: 50,
            height: 50,
            padding: const EdgeInsets.all(2.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF2761FF),
                width: 1.67,
              ),
            ),
            child: ClipOval(
              child: Image.asset(
                imageAsset,
                fit: BoxFit.cover,
                width: 46,
                height: 46,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF252525),
                ),
              ),
              Text(
                username,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF999999),
                ),
              ),
            ],
          ),
          const Spacer(),
          isRemove
              ? _buildActionButton('Remove', const Color(0xFFFD646F), () {})
              : _buildActionButton('Accept', const Color(0xFF31CD7A), () {}),
        ],
      ),
    );
  }

  Widget _buildActionButton(String text, Color color, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        elevation: 0,
        minimumSize: const Size(64, 32),
      ),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: 10,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }
}