import 'package:flutter/material.dart';
import 'package:myapp/data/app_db.dart';
import 'package:myapp/data/movie_dao.dart';
// import 'package:myapp/page-1/home.dart';
import 'package:myapp/page-1/movie-list.dart';
import 'package:myapp/utils.dart';

import 'widget/app_bar_custom.dart';

// import 'package:myapp/page-1/form.dart';
// import 'package:myapp/page-1/detail.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database =
      await $FloorAppDb.databaseBuilder('flutter_database.db').build();
  final movieDao = database.movieDaoc;

  runApp(MyApp(
    movieDao: movieDao,
  ));
}

class MyApp extends StatelessWidget {
  final MovieDao movieDao;

  const MyApp({
    super.key,
    required this.movieDao,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: const AppBarCustom(
          title: 'Popular Movies',
        ),
        body: Scene(movieDao: movieDao),
      ),
    );
  }
}
