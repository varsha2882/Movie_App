import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:movie_app/utils/text.dart';

class TV extends StatelessWidget {
  final List tv;

  const TV({required Key key, required this.tv}) : super(key: key);
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
            text: 'Popular TV Shows',
            size: 26,
            color: color,
          ),
          // ignore: prefer_const_constructors
          SizedBox(height: 10),
          // ignore: sized_box_for_whitespace
          Container(
              // color: Colors.red,
              height: 200,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: tv.length,
                  itemBuilder: (context, index) {
                    return Container(
                      // ignore: prefer_const_constructors
                      padding: EdgeInsets.all(5),
                      // color: Colors.green,
                      width: 250,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      // ignore: prefer_interpolation_to_compose_strings
                                      'https://image.tmdb.org/t/p/w500' +
                                          tv[index]['backdrop_path']),
                                  fit: BoxFit.cover),
                            ),
                            height: 140,
                          ),
                          // ignore: prefer_const_constructors
                          SizedBox(height: 5),
                          // ignore: avoid_unnecessary_containers
                          Container(
                            child: modified_text(
                                size: 15,
                                color: color,
                                // ignore: prefer_if_null_operators
                                text: tv[index]['original_name'] != null
                                    ? tv[index]['original_name']
                                    : 'Loading'),
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
