import 'package:flutter/material.dart';
import 'package:myapp/utils.dart';

class EditText extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? isPw;
  final double? height;
  final int? maxLine;
  final bool? isEnabled;
  final int? maxLength;
  final TextInputType? inputType;

  const EditText({
    Key? key,
    required this.title,
    required this.hint,
    required this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.isPw,
    this.height,
    this.maxLine,
    this.isEnabled,
    this.maxLength,
    this.inputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.only(
            left: 18,
            bottom: 3,
          ),
          child: Text(
            title,
            style: SafeGoogleFont(
              'Poppins',
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Color(0xffffffff),
            ),
          ),
        ),
        Container(
          height: height,
          margin: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
          decoration: BoxDecoration(
            color: Colors.grey.shade700,
            borderRadius: const BorderRadius.all(Radius.circular(15)),
          ),
          child: TextFormField(
            keyboardType: inputType,
            maxLength: maxLength,
            enabled: isEnabled ?? true,
            controller: controller,
            maxLines: maxLine,
            obscureText: isPw ?? false,
            cursorColor: const Color(0xffffffff),
            textAlignVertical: TextAlignVertical.center,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              counterText: "",
              hintText: hint,
              hintStyle: const TextStyle(
                color: Colors.black26,
              ),
              border: InputBorder.none,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
            ),
          ),
        ),
      ],
    );
  }
}
