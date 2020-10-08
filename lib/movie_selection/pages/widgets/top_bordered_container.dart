import 'package:flutter/material.dart';
import 'package:flutter_projects/movie_selection/constants.dart';
import 'package:flutter_projects/movie_selection/models/movie.dart';
import 'package:google_fonts/google_fonts.dart';
import 'tag_container.dart';


class TopBorderedContainer extends StatelessWidget {
  const TopBorderedContainer({
    Key key,
    @required this.movie,
    this.child,
  }) : super(key: key);

  final Movie movie;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sizeIcon = size.height * .035;

    final textStyle = GoogleFonts.barlowCondensed(
      fontSize: sizeIcon * .75,
      fontWeight: FontWeight.w500,
    );
    return Container(
      width: double.infinity,
      height: size.height * .11,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 40,
          )
        ],
        color: kPrimaryColor,
      ),
      child: child == null
          ? Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.favorite,
                size: sizeIcon,
                color: Colors.white60,
              ),
              Text(
                movie.likes.toString(),
                style: textStyle,
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TagContainer(
                tag: '  IDMB  ',
                gradient: LinearGradient(
                  colors: [Colors.yellow, Colors.orangeAccent],
                ),
              ),
              const SizedBox(height: 3),
              Text(
                movie.rate.toString(),
                style: textStyle,
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.favorite_border,
                size: sizeIcon,
                color: Colors.white60,
              ),
              Text(
                movie.dislikes.toString(),
                style: textStyle,
              ),
            ],
          )
        ],
      )
          : child,
    );
  }
}
