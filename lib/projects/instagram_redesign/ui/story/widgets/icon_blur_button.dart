import 'dart:ui';

import 'package:flutter/material.dart';


class IconBlurButton extends StatelessWidget {
  const IconBlurButton({
    Key? key,
    required this.onTap,
    required this.iconData,
    this.size,
  }) : super(key: key);

  final VoidCallback onTap;
  final IconData iconData;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size ?? 35,
      width: size ?? 35,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular((size ?? 35) * .4),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: IconButton(
          padding: const EdgeInsets.all(0),
          color: Colors.white,
          icon: Icon(iconData),
          onPressed: onTap,
        ),
      ),
    );
  }
}
