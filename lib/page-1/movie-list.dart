import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:myapp/data/movie_dao.dart';
import 'package:myapp/page-1/detail.dart';
import 'package:myapp/page-1/form.dart';
import 'package:myapp/utils.dart';

import '../data/movie_model.dart';
import '../widget/Button.dart';

class Scene extends StatefulWidget {
  final MovieDao movieDao;

  const Scene({
    super.key,
    required this.movieDao,
  });

  @override
  State<Scene> createState() => _SceneState();
}

class _SceneState extends State<Scene> {
  late MovieDao _movieDao;

  @override
  void initState() {
    _movieDao = widget.movieDao;
    _initMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return SizedBox(
      width: double.infinity,
      child: Container(
        // movielistRpr (2:4)
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xff2c2b2b),
        ),
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  StreamBuilder<List<MovieModel>>(
                      stream: _movieDao.findAllTasksAsStream(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        final movieData = snapshot.data ?? [];
                        return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: movieData.length,
                            itemBuilder: (_, index) {
                              return _movieItem(
                                movieData[index],
                                fem,
                                ffem,
                                index,
                              );
                            });
                      })
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Button(
                title: 'Add Movie',
                onClick: () async {
                  await Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return MovieForm(movieDao: _movieDao);
                  })).then((value) {
                    setState(() {
                      /* if (value is MovieModel) {
                        _movieList.add(value);
                      }*/
                    });
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _movieItem(
    MovieModel movie,
    double fem,
    double ffem,
    int index,
  ) {
    return InkWell(
      onTap: () async {
        await Navigator.push(context, MaterialPageRoute(builder: (_) {
          return Detail(movieDao: _movieDao, movieId: movie.id ?? 0);
        })).then((value) {
          setState(() {});
        });
      },
      child: Container(
        // group1udY (8:176)
        margin: EdgeInsets.fromLTRB(1 * fem, 0 * fem, 9 * fem, 30 * fem),
        width: double.infinity,
        height: 140 * fem,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // group1qn6 (8:803)
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 11 * fem, 0 * fem),
              width: 95 * fem,
              //height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(17 * fem),
              ),
              child: Center(
                // rectangle4N1L (8:802)
                child: SizedBox(
                  width: 95 * fem,
                  height: 120 * fem,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16 * fem),
                    child: movie.imgFromDevie != null
                        ? Image.memory(
                            movie.imgFromDevie!,
                            fit: BoxFit.cover,
                            errorBuilder: (_, o, e) {
                              return Image.asset(
                                'assets/page-1/images/img_placeholder.png',
                                fit: BoxFit.cover,
                              );
                            },
                          )
                        : Image.asset(
                            movie.image,
                            fit: BoxFit.cover,
                            errorBuilder: (_, o, e) {
                              return Image.asset(
                                'assets/page-1/images/img_placeholder.png',
                                fit: BoxFit.cover,
                              );
                            },
                          ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                // autogroupphbufFL (WE7pFDUksiE6qYKYpyPHBU)

                height: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      // spidermannowayhD1x (8:177)
                      movie.title,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: SafeGoogleFont(
                        'Poppins',
                        fontSize: 16 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.5 * ffem / fem,
                        color: Color(0xffffffff),
                      ),
                    ),
                    Container(
                      // autogroupbtvgxNr (WE7pc83b6teSmAawYYbTVG)
                      padding: EdgeInsets.fromLTRB(
                          0 * fem, 14 * fem, 0 * fem, 0 * fem),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            // autogroup3cjy5iN (WE7pM8Ua2HuZxrSDNc3cjY)
                            width: 59 * fem,
                            height: 38 * fem,
                            child: Stack(
                              children: [
                                Positioned(
                                  // frame72dc (8:185)
                                  left: 0 * fem,
                                  top: 20 * fem,
                                  child: Container(
                                    width: 59 * fem,
                                    height: 18 * fem,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          // ticketj2E (8:186)
                                          margin: EdgeInsets.fromLTRB(0 * fem,
                                              0 * fem, 4 * fem, 0 * fem),
                                          width: 16 * fem,
                                          height: 16 * fem,
                                          child: Image.asset(
                                            'assets/page-1/images/ticket-eCN.png',
                                            width: 16 * fem,
                                            height: 16 * fem,
                                          ),
                                        ),
                                        Text(
                                          // action3Yi (8:187)
                                          movie.genre,
                                          style: SafeGoogleFont(
                                            'Poppins',
                                            fontSize: 12 * ffem,
                                            fontWeight: FontWeight.w400,
                                            height: 1.5 * ffem / fem,
                                            color: Color(0xffeeeeee),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // ratingB98 (8:188)
                                  left: 0 * fem,
                                  top: 0 * fem,
                                  child: Container(
                                    width: 52 * fem,
                                    height: 24 * fem,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(6 * fem),
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          // starWBQ (8:189)
                                          margin: EdgeInsets.fromLTRB(0 * fem,
                                              0 * fem, 4 * fem, 0 * fem),
                                          width: 16 * fem,
                                          height: 16 * fem,
                                          child: Image.asset(
                                            'assets/page-1/images/star-LKG.png',
                                            width: 16 * fem,
                                            height: 16 * fem,
                                          ),
                                        ),
                                        Container(
                                          // autogroupswg23BL (WE7pUi6Gr3tgxRTQP7swG2)
                                          margin: EdgeInsets.fromLTRB(0 * fem,
                                              0.5 * fem, 0 * fem, 0 * fem),
                                          width: 32 * fem,
                                          height: double.infinity,
                                          child: Stack(
                                            children: [
                                              /* Positioned(
                                                // staryqg (8:190)
                                                left: 16 * fem,
                                                top: 7.5 * fem,
                                                child: Align(
                                                  child: SizedBox(
                                                    width: 16 * fem,
                                                    height: 16 * fem,
                                                    child: Image.asset(
                                                      'assets/page-1/images/star-xpN.png',
                                                      width: 16 * fem,
                                                      height: 16 * fem,
                                                    ),
                                                  ),
                                                ),
                                              ),*/
                                              Positioned(
                                                // h6thk (8:195)
                                                left: 0 * fem,
                                                top: 0 * fem,
                                                child: Align(
                                                  child: SizedBox(
                                                    width: 19 * fem,
                                                    height: 15 * fem,
                                                    child: Text(
                                                      movie.rating.toString(),
                                                      style: SafeGoogleFont(
                                                        'Montserrat',
                                                        fontSize: 12 * ffem,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        height:
                                                            1.2175 * ffem / fem,
                                                        letterSpacing:
                                                            0.1199999973 * fem,
                                                        color:
                                                            Color(0xffff8700),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 4 * fem,
                          ),
                          Container(
                            // frame59dg (8:179)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 143 * fem, 0 * fem),
                            width: double.infinity,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // calendarblank5GS (8:180)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 4 * fem, 0 * fem),
                                  width: 16 * fem,
                                  height: 16 * fem,
                                  child: Image.asset(
                                    'assets/page-1/images/calendarblank-Hup.png',
                                    width: 16 * fem,
                                    height: 16 * fem,
                                  ),
                                ),
                                Text(
                                  // QJi (8:181)
                                  movie.year.toString(),
                                  style: SafeGoogleFont(
                                    'Poppins',
                                    fontSize: 12 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.5 * ffem / fem,
                                    color: Color(0xffeeeeee),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 4 * fem,
                          ),
                          Container(
                            // frame891Q (8:182)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 98 * fem, 0 * fem),
                            width: double.infinity,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // clockVLA (8:183)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 4 * fem, 0 * fem),
                                  width: 16 * fem,
                                  height: 16 * fem,
                                  child: Image.asset(
                                    'assets/page-1/images/clock-UMc.png',
                                    width: 16 * fem,
                                    height: 16 * fem,
                                  ),
                                ),
                                Text(
                                  // minutesz22 (8:184)
                                  '${movie.time} minutes',
                                  style: SafeGoogleFont(
                                    'Poppins',
                                    fontSize: 12 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.5 * ffem / fem,
                                    color: Color(0xffeeeeee),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _initMovies() async {
    final defaultData = await _movieDao.findAllTasks();
    if (defaultData.isEmpty) {
      final List<MovieModel> movieList = [];
      movieList.add(MovieModel.spiderman());
      movieList.add(MovieModel.dog());
      movieList.add(MovieModel.drStrange());
      movieList.add(MovieModel.sonic());
      movieList.add(MovieModel.trainToBusan());

      await _movieDao.insertMovies(movieList);
    }
  }
}
