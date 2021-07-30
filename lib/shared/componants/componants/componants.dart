import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neo_mo_bmi/style/colors/colors.dart';
import 'package:neo_mo_bmi/style/text_style/text_style.dart';

class TextFieldRow extends StatelessWidget {
  final String name;
  final String svgImage;
  final String hint;
  final TextInputType inputType;
  final bool number;
  final TextEditingController textEditingController;

  TextFieldRow(
      {required this.name,
      required this.svgImage,
      required this.number,
      required this.textEditingController,
      required this.hint,
      required this.inputType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset(
            svgImage,
            fit: BoxFit.cover,
            height: 30,
          ),
          SizedBox(
            width: 5,
          ),
          Container(
              width: 60,
              child: Text(
                name,
                textAlign: TextAlign.start,
                style: arabicStyle.copyWith(fontSize: 16),
              )),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: darkColor, borderRadius: BorderRadius.circular(10)),
              child: TextFormField(
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'أدخل البيانات /  Can\'t be empty';
                  }
                },
                style: arabicStyle,
                controller: textEditingController,
                inputFormatters: number
                    ? [
                        FilteringTextInputFormatter.allow(
                          RegExp(r'[0-9]'),
                        ),
                      ]
                    : [
                        FilteringTextInputFormatter.deny(
                          RegExp(r'[0-9]'),
                        ),
                      ],
                textInputAction: TextInputAction.next,
                cursorColor: Colors.amber,
                keyboardType: inputType,
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: arabicStyle.copyWith(color: Colors.white38),
                  isCollapsed: false,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white54),
                      borderRadius: BorderRadius.circular(8)),
                  contentPadding: EdgeInsets.all(5),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white54),
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget defaultTextFormField({
  required String hint,
  required TextInputType inputType,
  required TextEditingController textEditingController,
  bool isPassword = false,
  required Icon perfixIcon,
  IconButton? suffixIcon,
}) {
  return TextFormField(
    onFieldSubmitted: (value) {
      textEditingController.text = value;
    },
    controller: textEditingController,
    style: arabicStyle,
    obscureText: isPassword,
    // inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'[0-9]'))],
    textInputAction: TextInputAction.next,
    cursorColor: Colors.amber,
    keyboardType: TextInputType.text,
    decoration: InputDecoration(
      prefixIcon: perfixIcon,
      suffixIcon: suffixIcon,
      hintText: hint,
      hintStyle: arabicStyle.copyWith(color: Colors.white38),
      isCollapsed: false,
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white54),
          borderRadius: BorderRadius.circular(8)),
      contentPadding: EdgeInsets.all(5),
      border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white54),
          borderRadius: BorderRadius.circular(10)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.white),
      ),
    ),
  );
}

void navigateTo(context, Widget widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

void navigateToAndRemove(context, Widget widget) {
  Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => widget), (route) => false);
}
