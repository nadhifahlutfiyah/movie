import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/utils.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AppBarCustom({
    Key? key,
    required this.title,
  })  : preferredSize = const Size.fromHeight(50),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xff2c2b2b),
      centerTitle: true,
      leading: InkWell(
        onTap: () {
          if (Navigator.of(context).canPop()) {
            Navigator.pop(context);
          }
        },
        child: Container(
          width: 11,
          height: 11,
          padding: EdgeInsets.all(18),
          child: Image.asset(
            'assets/page-1/images/vector-Eei.png',
            width: 5,
          ),
        ),
      ),
      title: Text(
        title,
        style: SafeGoogleFont(
          'Poppins',
          fontSize: 17,
          fontWeight: FontWeight.w700,
          color: const Color(0xffffffff),
        ),
      ),
    );
  }
}
