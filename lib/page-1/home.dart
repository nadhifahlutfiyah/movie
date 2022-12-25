import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';

class Scene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // home2BG (2:3)
        width: double.infinity,
        height: 800*fem,
        decoration: BoxDecoration (
          color: Color(0xff2c2b2b),
        ),
        child: Stack(
          children: [
            Positioned(
              // autogroupallnVUA (WE7oBfQzAbadNSkwbsaLLn)
              left: 0*fem,
              top: 0*fem,
              child: Container(
                width: 360*fem,
                height: 560*fem,
                child: Stack(
                  children: [
                    Positioned(
                      // whatdoyouwanttowatchakW (6:2)
                      left: 22*fem,
                      top: 19*fem,
                      child: Align(
                        child: SizedBox(
                          width: 251*fem,
                          height: 26*fem,
                          child: Text(
                            'What do you want to watch? ',
                            style: SafeGoogleFont (
                              'Poppins',
                              fontSize: 17*ffem,
                              fontWeight: FontWeight.w600,
                              height: 1.5*ffem/fem,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // squarezpE (10:2)
                      left: 22*fem,
                      top: 55*fem,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(17*fem, 5*fem, 17*fem, 7*fem),
                        width: 318*fem,
                        height: 32*fem,
                        decoration: BoxDecoration (
                          color: Color(0x56e7e1e1),
                          borderRadius: BorderRadius.circular(11*fem),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // searchdsC (10:5)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 224*fem, 0*fem),
                              child: Text(
                                'Search',
                                style: SafeGoogleFont (
                                  'Poppins',
                                  fontSize: 13*ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.5*ffem/fem,
                                  color: Color(0xffbdbaba),
                                ),
                              ),
                            ),
                            Container(
                              // searchVY2 (10:6)
                              margin: EdgeInsets.fromLTRB(0*fem, 1*fem, 0*fem, 0*fem),
                              width: 14*fem,
                              height: 11*fem,
                              child: Image.asset(
                                'assets/page-1/images/search.png',
                                width: 14*fem,
                                height: 11*fem,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      // autogroupqucrcce (WE7naWktQwxYzDrG2Fqucr)
                      left: 25*fem,
                      top: 138*fem,
                      child: Container(
                        width: 316*fem,
                        height: 190*fem,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // squarekD4 (10:8)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 26*fem, 0*fem),
                              height: double.infinity,
                              decoration: BoxDecoration (
                                borderRadius: BorderRadius.circular(11*fem),
                              ),
                              child: Center(
                                // squareeZL (10:9)
                                child: SizedBox(
                                  width: 145*fem,
                                  height: 190*fem,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(11*fem),
                                    child: Image.asset(
                                      'assets/page-1/images/square-kW2.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              // squarem8A (10:11)
                              height: double.infinity,
                              decoration: BoxDecoration (
                                borderRadius: BorderRadius.circular(11*fem),
                              ),
                              child: Center(
                                // squareKQa (10:12)
                                child: SizedBox(
                                  width: 145*fem,
                                  height: 190*fem,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(11*fem),
                                    child: Image.asset(
                                      'assets/page-1/images/square-QgW.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      // autogrouphp2eexe (WE7nnWQuH2YrRfyExcHP2E)
                      left: 25*fem,
                      top: 349*fem,
                      child: Container(
                        width: 316*fem,
                        height: 190*fem,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // squaremGa (10:396)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 26*fem, 0*fem),
                              height: double.infinity,
                              decoration: BoxDecoration (
                                borderRadius: BorderRadius.circular(11*fem),
                              ),
                              child: Center(
                                // square75Y (10:397)
                                child: SizedBox(
                                  width: 145*fem,
                                  height: 190*fem,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(11*fem),
                                    child: Image.asset(
                                      'assets/page-1/images/square-nWi.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              // squareq1Y (10:400)
                              height: double.infinity,
                              decoration: BoxDecoration (
                                borderRadius: BorderRadius.circular(11*fem),
                              ),
                              child: Center(
                                // squarePYr (10:401)
                                child: SizedBox(
                                  width: 145*fem,
                                  height: 190*fem,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(11*fem),
                                    child: Image.asset(
                                      'assets/page-1/images/square.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      // nowplayingupcomingtopratedpopu (10:13)
                      left: 22*fem,
                      top: 105*fem,
                      child: Align(
                        child: SizedBox(
                          width: 328*fem,
                          height: 17*fem,
                          child: Text(
                            'Now Playing           Upcoming              Top rated            Popular',
                            style: SafeGoogleFont (
                              'Poppins',
                              fontSize: 11*ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.5*ffem/fem,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // minusxVU (10:462)
                      left: 23*fem,
                      top: 126*fem,
                      child: Align(
                        child: SizedBox(
                          width: 67*fem,
                          height: 2*fem,
                          child: Image.asset(
                            'assets/page-1/images/minus.png',
                            width: 67*fem,
                            height: 2*fem,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              // autogroup2vb4drW (WE7nvfqy5zqka8cDRw2Vb4)
              left: 0*fem,
              top: 560*fem,
              child: Container(
                width: 360*fem,
                height: 240*fem,
                child: Stack(
                  children: [
                    Positioned(
                      // squaremC2 (10:423)
                      left: 196*fem,
                      top: 0*fem,
                      child: Container(
                        width: 145*fem,
                        height: 190*fem,
                        decoration: BoxDecoration (
                          borderRadius: BorderRadius.circular(11*fem),
                        ),
                        child: Center(
                          // squareW9c (10:424)
                          child: SizedBox(
                            width: 145*fem,
                            height: 190*fem,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(11*fem),
                              child: Image.asset(
                                'assets/page-1/images/square-jR8.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // squareSox (10:402)
                      left: 25*fem,
                      top: 0*fem,
                      child: Container(
                        width: 145*fem,
                        height: 190*fem,
                        decoration: BoxDecoration (
                          borderRadius: BorderRadius.circular(11*fem),
                        ),
                        child: Center(
                          // squarencv (10:403)
                          child: SizedBox(
                            width: 145*fem,
                            height: 190*fem,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(11*fem),
                              child: Image.asset(
                                'assets/page-1/images/square-A4N.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // rectangle6GY6 (10:459)
                      left: 0*fem,
                      top: 176*fem,
                      child: Align(
                        child: SizedBox(
                          width: 360*fem,
                          height: 64*fem,
                          child: Container(
                            decoration: BoxDecoration (
                              border: Border.all(color: Color(0xffbbddbb)),
                              color: Color(0xff2c2b2b),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // igaminghousePMp (10:482)
                      left: 60*fem,
                      top: 188*fem,
                      child: Container(
                        width: 22*fem,
                        height: 26*fem,
                        child: Center(
                          child: Center(
                            child: Text(
                              '􀎞',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont (
                                'SF Pro Display',
                                fontSize: 18*ffem,
                                fontWeight: FontWeight.w500,
                                height: 2.7777777778*ffem/fem,
                                color: Color(0xffbdbbbb),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // vector4yk (9:510)
                      left: 294*fem,
                      top: 192*fem,
                      child: Align(
                        child: SizedBox(
                          width: 16*fem,
                          height: 18*fem,
                          child: Image.asset(
                            'assets/page-1/images/vector-Qar.png',
                            width: 16*fem,
                            height: 18*fem,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // homesearchwatchlistxpE (12:327)
                      left: 58*fem,
                      top: 217.5*fem,
                      child: Align(
                        child: SizedBox(
                          width: 272*fem,
                          height: 15*fem,
                          child: Text(
                            'Home                                Search                           Watch list',
                            style: SafeGoogleFont (
                              'Poppins',
                              fontSize: 10*ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.5*ffem/fem,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              // searchqd8 (10:486)
              left: 178*fem,
              top: 751*fem,
              child: Align(
                child: SizedBox(
                  width: 20*fem,
                  height: 19*fem,
                  child: Image.asset(
                    'assets/page-1/images/search-qKC.png',
                    width: 20*fem,
                    height: 19*fem,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
          );
  }
}