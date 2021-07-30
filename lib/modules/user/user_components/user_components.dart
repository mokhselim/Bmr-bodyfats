import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neo_mo_bmi/style/colors/colors.dart';
import 'package:neo_mo_bmi/style/text_style/text_style.dart';

Widget userButton({
  required Function onPressed,
  required String title,
  required String arTitle,
}) {
  return Container(
    decoration: BoxDecoration(
      color: darkColor,
      borderRadius: BorderRadius.circular(15),
    ),
    child: TextButton(
      onPressed: () {
        onPressed();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            title.toUpperCase(),
            style: englishStyle.copyWith(
              fontWeight: FontWeight.normal,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            arTitle,
            style: arabicStyle.copyWith(
                fontWeight: FontWeight.normal,
                fontSize: 16,
                color: Colors.yellow),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );
}
