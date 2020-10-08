import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants.dart';


class GradientButton extends StatelessWidget {
  const GradientButton({
    Key key,
    this.text,
    this.onTap,
    this.width,
  }) : super(key: key);

  final String text;
  final double width;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        alignment: Alignment.center,
        height: size.height * .07,
        width: width?? size.width,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 20,
              )
            ],
            borderRadius: BorderRadius.circular(8),
            gradient: kGradientRedOrange),
        child: Text(
          text,
          style: GoogleFonts.barlowCondensed(
              fontSize: size.height * .027,
              fontWeight: FontWeight.w500,
              letterSpacing: 4),
        ),
      ),
    );
  }
}