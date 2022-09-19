import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages, unused_import
import 'package:movie_app/utils/text.dart';
// ignore: depend_on_referenced_packages, unused_import
import 'package:movie_app/widgets/toprated.dart';
// ignore: depend_on_referenced_packages, unused_import
import 'package:movie_app/widgets/trending.dart';
// ignore: depend_on_referenced_packages, unused_import
import 'package:movie_app/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() => runApp(MyApp());

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // ignore: prefer_const_constructors
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, primaryColor: Colors.green),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingmovies = [];
  List topratedmovies = [];
  List tv = [];
  final String apikey = '5ffcdd84ccb809e8c19afd4d4cc01ba5';
  final readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1ZmZjZGQ4NGNjYjgwOWU4YzE5YWZkNGQ0Y2MwMWJhNSIsInN1YiI6IjYzMjgwZDA1YjE4ZjMyMDA4MDEzMmY4NiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.u5FiNz7fVTi9bkMLraLLItiUPL6swhoGJ-MuE-hJI5o';
  @override
  void initState() {
    super.initState();
    loadmovies();
  }

  loadmovies() async {
    // ignore: unused_local_variable
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apikey, readaccesstoken),
      // ignore: unused_label, prefer_const_constructors
      logConfig: ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );
    // ignore: unused_local_variable
    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    // ignore: deprecated_member_use
    Map tvresult = await tmdbWithCustomLogs.v3.tv.getPouplar();
    // ignore: avoid_print
    print((trendingresult));
    setState(() {
      trendingmovies = trendingresult['results'];
      topratedmovies = topratedresult['results'];
      tv = tvresult['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text('Movie App'),
      ),
    );
  }

  @override
// ignore: override_on_non_overriding_member
  Widget build2(BuildContext context) {
    // ignore: prefer_typing_uninitialized_variables
    var trendingmovies;
    // ignore: prefer_typing_uninitialized_variables
    var tv;
    // ignore: prefer_typing_uninitialized_variables
    var topratedmovies;
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: modified_text(text: 'Movie App ❤️'),
        ),
        body: ListView(
          children: [
            TV(tv: tv),
            TrendingMovies(
              trending: trendingmovies,
            ),
            TopratedMovies(
              toprated: topratedmovies,
            ),
          ],
        ));
  }

// ignore: non_constant_identifier_names
  TV({required tv}) {}

// ignore: non_constant_identifier_names
  TopratedMovies({required toprated}) {}

// ignore: non_constant_identifier_names
  TrendingMovies({required trending}) {}

// ignore: non_constant_identifier_names
  modified_text({required String text}) {}
}
