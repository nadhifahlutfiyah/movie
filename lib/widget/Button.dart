import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myapp/utils.dart';

class Button extends StatelessWidget {
  final Function() onClick;
  final String title;
  final double? width;

  const Button({
    Key? key,
    required this.onClick,
    required this.title,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Center(
        child: Container(
          width: width ?? 144,
          height: 36,
          decoration: BoxDecoration(
            color: const Color(0xffbf3333),
            borderRadius: BorderRadius.circular(6),
            boxShadow: const [
              BoxShadow(
                color: Color(0x3f000000),
                offset: Offset(5, 5),
                blurRadius: 2,
              ),
            ],
          ),
          child: Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: SafeGoogleFont(
                'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.w600,
                height: 1.4000000272,
                color: const Color(0xffffffff),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
