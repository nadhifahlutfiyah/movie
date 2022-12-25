import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:myapp/data/movie_dao.dart';
import 'package:myapp/data/movie_model.dart';
import 'package:myapp/utils.dart';
import 'package:myapp/widget/app_bar_custom.dart';

import '../widget/Button.dart';
import 'form.dart';

class Detail extends StatefulWidget {
  final int movieId;
  final MovieDao movieDao;

  const Detail({
    super.key,
    required this.movieDao,
    required this.movieId,
  });

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  late MovieDao movieDao;

  @override
  void initState() {
    movieDao = widget.movieDao;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2c2b2b),
      appBar: const AppBarCustom(title: "Detail"),
      body: StreamBuilder<MovieModel?>(
          stream: movieDao.findMovieByIdAsStream(widget.movieId),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Container();
            }
            final movie = snapshot.data!;
            return Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _headerImg(movie),
                    _headerTitle(movie),
                    _headerSubTitle(movie),
                    _sinopsis(movie),
                  ],
                ),
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Button(
                    title: 'Update',
                    onClick: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return MovieForm(
                          movieDao: widget.movieDao,
                          movieId: movie.id,
                        );
                      })).then((value) async {
                        if (value != null) {
                          setState(() {});
                        }
                      });
                    },
                  ),
                ),
              ],
            );
          }),
    );
  }

  _headerImg(MovieModel movie) {
    return Stack(
      children: [
        SizedBox(
          height: 200,
          width: double.maxFinite,
          child: movie.imgFromDevie != null
              ? Image.memory(
                  movie.imgFromDevie!,
                  fit: BoxFit.fill,
                  errorBuilder: (_, o, e) {
                    return Image.asset(
                      'assets/page-1/images/img_placeholder.png',
                      fit: BoxFit.cover,
                    );
                  },
                )
              : Image.asset(
                  movie.image,
                  fit: BoxFit.fill,
                  errorBuilder: (_, o, e) {
                    return Image.asset(
                      'assets/page-1/images/img_placeholder.png',
                      fit: BoxFit.cover,
                    );
                  },
                ),
        ),
        Positioned(
            bottom: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      'assets/page-1/images/star-LKG.png',
                      width: 20,
                      height: 20,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      movie.rating.toString(),
                      style: SafeGoogleFont(
                        'Montserrat',
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        height: 1.2175,
                        letterSpacing: 0.1199999973,
                        color: Color(0xffff8700),
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ],
    );
  }

  _headerTitle(MovieModel movie) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Text(
        movie.title,
        style: SafeGoogleFont(
          'Poppins',
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Color(0xffffffff),
        ),
      ),
    );
  }

  _headerSubTitle(MovieModel movie) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.calendar_month_outlined,
            color: Colors.white,
          ),
          const SizedBox(width: 5),
          Text(
            movie.year.toString(),
            style: SafeGoogleFont(
              'Poppins',
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xffffffff),
            ),
          ),
          _verticalLine(),
          const Icon(
            Icons.timer,
            color: Colors.white,
          ),
          const SizedBox(width: 5),
          Text(
            '${movie.time} Minutes',
            style: SafeGoogleFont(
              'Poppins',
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xffffffff),
            ),
          ),
          _verticalLine(),
          const Icon(
            Icons.newspaper,
            color: Colors.white,
          ),
          const SizedBox(width: 5),
          Text(
            movie.genre,
            style: SafeGoogleFont(
              'Poppins',
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xffffffff),
            ),
          ),
        ],
      ),
    );
  }

  _verticalLine() {
    return const SizedBox(
      height: 20,
      child: VerticalDivider(
        color: Colors.white,
        thickness: 2,
        indent: 5,
        endIndent: 0,
        width: 20,
      ),
    );
  }

  _sinopsis(MovieModel movie) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sinopsis',
            style: SafeGoogleFont(
              'Poppins',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xffffffff),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            movie.sinopsis.isEmpty ? 'Tidak Ada Sinopsi' : movie.sinopsis,
            style: SafeGoogleFont(
              'Poppins',
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xffffffff),
            ),
          )
        ],
      ),
    );
  }
}
