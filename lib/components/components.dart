import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neo_mo_bmi/style/colors/colors.dart';
import 'package:neo_mo_bmi/style/text_style/text_style.dart';

Widget genderContainer(
    {required var cubit, required String photo, required bool male}) {
  return Expanded(
    child: InkWell(
      splashColor: Colors.transparent,
      onTap: () {
        cubit.userType();
      },
      child: Column(
        children: [
          male
              ? Container(
                  decoration: cubit.male
                      ? BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              backgrondColor,
                              darkColor,
                              Colors.pinkAccent,
                              darkColor,
                              backgrondColor,
                            ],
                            end: Alignment.topCenter,
                            begin: Alignment.bottomCenter,
                          ),
                          color: darkColor,
                          borderRadius: BorderRadius.circular(20),
                        )
                      : BoxDecoration(
                          color: backgrondColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                  child: SvgPicture.asset(
                    photo,
                    // height: 140,
                  ),
                )
              : Container(
                  decoration: !cubit.male
                      ? BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              backgrondColor,
                              darkColor,
                              Colors.pinkAccent,
                              darkColor,
                              backgrondColor,
                            ],
                            end: Alignment.topCenter,
                            begin: Alignment.bottomCenter,
                          ),
                          color: darkColor,
                          borderRadius: BorderRadius.circular(20),
                        )
                      : BoxDecoration(
                          color: backgrondColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                  child: SvgPicture.asset(
                    photo,
                    // height: 140,
                  ),
                ),
          SizedBox(
            height: 10,
          ),
          Text(
            cubit.language[0],
            style: arabicStyle.copyWith(
                color: Colors.amber, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  );
}

Widget buttonSheetWidget() {
  return Container(
    height: 410,
    margin: EdgeInsets.only(top: 50, right: 10, left: 10, bottom: 50),
    decoration: BoxDecoration(
      color: Colors.black54,
      borderRadius: BorderRadius.circular(20),
    ),
    child: SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          Container(
            height: 200,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.asset(
              'assets/images/Tapemeasurecolored.jpeg',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 200,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.asset('assets/images/measure.jpg', fit: BoxFit.cover),
          ),
        ],
      ),
    ),
  );
}
