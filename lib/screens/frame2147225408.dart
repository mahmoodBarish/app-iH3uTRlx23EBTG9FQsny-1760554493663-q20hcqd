import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class Frame2147225408 extends StatelessWidget {
  const Frame2147225408({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          'Arabic Version',
          textAlign: TextAlign.left,
          style: GoogleFonts.poppins(
            fontSize: 60,
            fontWeight: FontWeight.w500,
            color: const Color(0xFFFFFFFF),
          ),
        ),
      ),
    );
  }
}