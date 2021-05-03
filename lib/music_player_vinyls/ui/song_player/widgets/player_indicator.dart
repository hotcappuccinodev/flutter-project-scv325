import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlayerIndicator extends StatelessWidget {
  final String songTitle;
  final double percentIndicator;

  const PlayerIndicator({
    Key key,
    @required this.songTitle,
    @required this.percentIndicator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        FittedBox(
          child: Text(
            songTitle,
            maxLines: 1,
            style: GoogleFonts.spectral(
              fontSize: 50,
              fontWeight: FontWeight.w800,
              shadows: [
                Shadow(
                  color: Colors.black26,
                  blurRadius: 40,
                  offset: Offset(0, 20),
                )
              ],
            ),
          ),
        ),
        CustomPaint(
          painter: _LineIndicator(percentIndicator - .005),
          child: ClipPath(
            clipper: _TextClipper(percentIndicator),
            child: FittedBox(
              child: Text(
                songTitle,
                maxLines: 1,
                overflow: TextOverflow.clip,
                softWrap: false,
                style: GoogleFonts.spectral(
                  fontSize: 50,
                  color: Colors.white70,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _LineIndicator extends CustomPainter {
  final double percent;

  _LineIndicator(this.percent);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(
      Offset(size.width * percent, 0),
      Offset(size.width * percent, size.height),
      Paint()
        ..style = PaintingStyle.stroke
        ..color = Colors.black
        ..strokeWidth = 3.0,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class _TextClipper extends CustomClipper<Path> {
  final double percent;

  _TextClipper(this.percent);

  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(size.width * percent, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width * percent, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
