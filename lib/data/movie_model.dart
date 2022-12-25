import 'dart:typed_data';

import 'package:floor/floor.dart';

/// MovieModel bertujuan untuk menyimpan data List Movie di dalam Object atau Class
/// agar memudahkan mapping data dan juga insert data

@entity
class MovieModel {
  @PrimaryKey(autoGenerate: true)
  final int? id;

  final String title;
  final double rating;
  final String genre;
  final int year;
  final int time;
  final String image;
  final String sinopsis;
  final Uint8List? imgFromDevie;

  MovieModel({
    this.id,
    required this.title,
    required this.rating,
    required this.genre,
    required this.year,
    required this.time,
    required this.image,
    required this.sinopsis,
    this.imgFromDevie,
  });

  factory MovieModel.spiderman() {
    return MovieModel(
      title: 'Spider-Man: No Way Home',
      rating: 8.5,
      genre: 'Action',
      year: 2021,
      time: 139,
      image: 'assets/page-1/images/rectangle-4-ZDQ.png',
      sinopsis: '',
    );
  }

  factory MovieModel.dog() {
    return MovieModel(
      title: 'Dog',
      rating: 7.5,
      genre: 'Action',
      year: 2021,
      time: 139,
      image: 'assets/page-1/images/rectangle-4-Zzv.png',
      sinopsis: '',
    );
  }

  factory MovieModel.drStrange() {
    return MovieModel(
      title: 'Dr. Strange: Multiverse Of Madness',
      rating: 8.5,
      genre: 'Action',
      year: 2021,
      time: 139,
      image: 'assets/page-1/images/rectangle-4.png',
      sinopsis: '',
    );
  }

  factory MovieModel.sonic() {
    return MovieModel(
      title: 'Sonic 2: The Hedgehog',
      rating: 8.5,
      genre: 'Action',
      year: 2021,
      time: 139,
      image: 'assets/page-1/images/rectangle-4-84e.png',
      sinopsis: '',
    );
  }

  factory MovieModel.trainToBusan() {
    return MovieModel(
      title: 'Train to Busan: Peninsula',
      rating: 8.5,
      genre: 'Action',
      year: 2021,
      time: 139,
      image: 'assets/page-1/images/rectangle-4-7ki.png',
      sinopsis: '',
    );
  }

  MovieModel copyWith({
    int? id,
    String? title,
    double? rating,
    String? genre,
    int? year,
    int? time,
    String? image,
    String? sinopsis,
    Uint8List? imgFromDevie,
  }) {
    return MovieModel(
        id: id ?? this.id,
        title: title ?? this.title,
        rating: rating ?? this.rating,
        genre: genre ?? this.genre,
        year: year ?? this.year,
        time: time ?? this.time,
        image: image ?? this.image,
        sinopsis: sinopsis ?? this.sinopsis,
        imgFromDevie: imgFromDevie ?? this.imgFromDevie);
  }
}
