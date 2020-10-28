import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class CardPlaceInformation extends StatelessWidget {
  const CardPlaceInformation({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(bottom: 25),
          height: MediaQuery.of(context).size.height * .15,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black12,
              )
            ],
          ),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(3, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.pinkAccent,
                      foregroundColor: Colors.white,
                      child: Icon(
                        [
                          FontAwesome.facebook,
                          FontAwesome.twitter,
                          FontAwesome.google,
                        ][index],
                        size: 12,
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 10),
              Row(
                children: <Widget>[
                  _InlineTextSpan(
                    field: 'Telefono',
                    value: '355 655 8898',
                  ),
                  const Spacer(),
                  _InlineTextSpan(
                    field: 'Servicion a domicilio',
                    value: 'Si',
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: <Widget>[
                  _InlineTextSpan(
                    field: 'Lugar',
                    value: 'Mexico Guerrero',
                  ),
                  const Spacer(),
                  _InlineTextSpan(
                    field: 'Horario: ',
                    value: '07:00 a 18:00',
                  ),
                ],
              )
            ],
          ),
        ),
        FloatingActionButton(
          onPressed: () {},
          elevation: 2,
          child: Icon(Icons.person_pin_circle, color: Colors.white, size: 35),
          backgroundColor: Colors.pinkAccent,
        )
      ],
    );
  }
}

class _InlineTextSpan extends StatelessWidget {
  final String field;
  final String value;

  const _InlineTextSpan({Key key, this.field, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: field,
          style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: MediaQuery.of(context).size.height * .014,
              color: Colors.black,
              fontWeight: FontWeight.w500),
          children: [
            TextSpan(
              text: " $value",
              style: TextStyle(color: Colors.grey),
            ),
          ]),
    );
  }
}
