import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:movie_app/utils/text.dart';

class TopRatedMovies extends StatelessWidget {
  final List toprated;

  const TopRatedMovies({required Key key, required this.toprated})
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
        children: [
          // ignore: prefer_const_constructors
          modified_text(
            text: 'Top Rated Movies',
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
                  itemCount: toprated.length,
                  itemBuilder: (context, index) {
                    // ignore: sized_box_for_whitespace, prefer_typing_uninitialized_variables
                    var color;
                    // ignore: sized_box_for_whitespace
                    return Container(
                      width: 140,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    // ignore: prefer_interpolation_to_compose_strings
                                    'https://image.tmdb.org/t/p/w500' +
                                        toprated[index]['poster_path']),
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
                              color: color,
                              // ignore: prefer_if_null_operators
                              text: toprated[index]['title'] != null
                                  ? toprated[index]['title']
                                  : 'Loading',
                            ),
                          )
                        ],
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
