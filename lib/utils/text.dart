import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: camel_case_types
class modified_text extends StatelessWidget {
  final String text;
  final Color color;
  final double size;

  // ignore: use_key_in_widget_constructors, prefer_const_constructors_in_immutables
  modified_text({required this.text, required this.color, required this.size});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.breeSerif(color: color, fontSize: size),
    );
  }
}
