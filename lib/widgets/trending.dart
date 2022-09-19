// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;
  const TrendingMovies({required Key key, required this.trending})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_typing_uninitialized_variables
    var color;
    return Container(
      // ignore: prefer_const_constructors
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          // ignore: prefer_const_constructors
          modified_text(
            text: 'Trending Movies',
            size: 26,
            color: color,
          ),
          // ignore: prefer_const_constructors
          SizedBox(height: 10),
          // ignore: sized_box_for_whitespace
          Container(
              height: 270,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: trending.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Description(
                                      name: trending[index]['title'],
                                      bannerurl:
                                          // ignore: prefer_interpolation_to_compose_strings
                                          'https://image.tmdb.org/t/p/w500' +
                                              trending[index]['backdrop_path'],
                                      posterurl:
                                          // ignore: prefer_interpolation_to_compose_strings
                                          'https://image.tmdb.org/t/p/w500' +
                                              trending[index]['poster_path'],
                                      description: trending[index]['overview'],
                                      vote: trending[index]['vote_average']
                                          .toString(),
                                      launch_on: trending[index]
                                          ['release_date'],
                                    )));
                      },
                      // ignore: sized_box_for_whitespace
                      child: Container(
                        width: 140,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      // ignore: prefer_interpolation_to_compose_strings
                                      'https://image.tmdb.org/t/p/w500' +
                                          trending[index]['poster_path']),
                                ),
                              ),
                              height: 200,
                            ),
                            // ignore: prefer_const_constructors
                            SizedBox(height: 5),
                            // ignore: avoid_unnecessary_containers
                            Container(
                              child: modified_text(
                                size: 15,
                                // ignore: prefer_if_null_operators
                                text: trending[index]['title'] != null
                                    ? trending[index]['title']
                                    : 'Loading',
                                color: color,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Description(
    {required name,
    required String bannerurl,
    required String posterurl,
    required description,
    required String vote,
    // ignore: non_constant_identifier_names
    required launch_on}) {}
