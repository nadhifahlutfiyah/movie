import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myapp/data/movie_dao.dart';
import 'package:myapp/data/movie_model.dart';
import 'package:path_provider/path_provider.dart';

import '../widget/Button.dart';
import '../widget/app_bar_custom.dart';
import '../widget/edit_text.dart';

class MovieForm extends StatefulWidget {
  final MovieDao movieDao;
  final int? movieId;

  const MovieForm({
    super.key,
    required this.movieDao,
    this.movieId,
  });

  @override
  State<MovieForm> createState() => _MovieFormState();
}

class _MovieFormState extends State<MovieForm> {
  late MovieDao _movieDao;
  MovieModel? _movie;
  Uint8List? _imgDevice;

  final _titleCntrl = TextEditingController();
  final _genreCntrl = TextEditingController();
  final _rateCntrl = TextEditingController();
  final _yearCntrl = TextEditingController();
  final _imgCntrl = TextEditingController();
  final _sinopsisCntrl = TextEditingController();

  @override
  void initState() {
    _init();
    super.initState();
  }

  _init() async {
    _movieDao = widget.movieDao;

    if (widget.movieId != null) {
      _movie = (await _movieDao.findMovieById(widget.movieId!))!;
      if (_movie != null) {
        _titleCntrl.text = _movie!.title;
        _genreCntrl.text = _movie!.genre;
        _rateCntrl.text = _movie!.rating.toString();
        _yearCntrl.text = _movie!.year.toString();
        _imgCntrl.text = _movie!.image;
        _sinopsisCntrl.text = _movie!.sinopsis;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xff2c2b2b),
      appBar: const AppBarCustom(title: 'Fill This Form'),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    EditText(
                      title: 'Title',
                      hint: 'Title',
                      controller: _titleCntrl,
                    ),
                    const SizedBox(height: 15),
                    EditText(
                      title: 'Genre',
                      hint: 'Genre',
                      controller: _genreCntrl,
                    ),
                    const SizedBox(height: 15),
                    EditText(
                      title: 'Rate',
                      hint: 'Rate',
                      maxLength: 4,
                      inputType: TextInputType.number,
                      controller: _rateCntrl,
                    ),
                    const SizedBox(height: 15),
                    EditText(
                      title: 'Year',
                      hint: 'Year',
                      maxLength: 4,
                      inputType: TextInputType.number,
                      controller: _yearCntrl,
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Flexible(
                          child: EditText(
                            title: 'Image',
                            hint: 'Image',
                            isEnabled: false,
                            controller: _imgCntrl,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Button(
                            onClick: () async {
                              final pickedFile = await ImagePicker().pickImage(
                                source: ImageSource.gallery,
                                imageQuality: 60,
                              );
                              if (pickedFile != null) {
                                _imgCntrl.text = pickedFile.name;
                                _imgDevice =
                                    File(pickedFile.path).readAsBytesSync();
                                setState(() {});
                              }
                            },
                            width: 100,
                            title: "Image",
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 15),
                    EditText(
                      title: 'Sinopsis',
                      hint: 'Sinopsis',
                      height: 100,
                      maxLine: 4,
                      controller: _sinopsisCntrl,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Button(
                title: 'Save',
                onClick: () async {
                  MovieModel saveData = MovieModel(
                    title: _titleCntrl.text,
                    rating: double.tryParse(_rateCntrl.text) ?? 0.0,
                    genre: _genreCntrl.text,
                    year: int.tryParse(_yearCntrl.text) ?? 0,
                    time: _movie != null ? _movie!.time.toInt() : 10,
                    image: _imgCntrl.text,
                    sinopsis: _sinopsisCntrl.text,
                    imgFromDevie: _imgDevice,
                  );

                  if (_movie != null) {
                    saveData = saveData.copyWith(id: _movie!.id);
                    await _movieDao
                        .updateMovie(saveData)
                        .then((value) => Navigator.pop(context, true));
                  } else {
                    await _movieDao
                        .insertMovie(saveData)
                        .then((value) => Navigator.pop(context, true));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  _textForm() async {
    final Directory temp = await getTemporaryDirectory();
    final File imageFile = File('${temp.path}/images/someImageFile.png');
    if (await imageFile.exists()) {
    } else {
      await imageFile.create(recursive: true);
    }
  }
}
