import 'package:flutter/material.dart';
import 'package:movie_app/discription.dart';

import '../utils/custom_text.dart';

class TopRatedTvShows extends StatelessWidget {
  const TopRatedTvShows({super.key, required this.topRatedTvShows});

  final List topRatedTvShows;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            text: 'Top Rated TV Shows',
            color: Colors.white,
            size: 20,
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 220,
            padding: EdgeInsets.all(10),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: topRatedTvShows.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description(
                                name: topRatedTvShows[index]['original_name'],
                                bannerurl:
                                ('https://image.tmdb.org/t/p/w500' +
                                    topRatedTvShows[index]['backdrop_path']).toString(),
                                posterurl:
                                'https://image.tmdb.org/t/p/w500' +
                                    topRatedTvShows[index]['poster_path'].toString(),
                                description: topRatedTvShows[index]['overview'],
                                vote: topRatedTvShows[index]['vote_average']
                                    .toString(),
                                launchOn: topRatedTvShows[index]
                                ['release_date'],
                              )));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      width: 250,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                    "https://image.tmdb.org/t/p/w500/" +
                                        topRatedTvShows[index]['backdrop_path']
                                            .toString(),
                                  ),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: 140,
                            width: 250,
                          ),
                          Container(
                            child: CustomText(
                              text: topRatedTvShows[index]['original_name'] !=
                                      null
                                  ? topRatedTvShows[index]['original_name']
                                  : 'loading',
                              color: Colors.white,
                              size: 15,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
