import 'package:flutter/material.dart';

import '../discription.dart';
import '../utils/custom_text.dart';

class TopRatedMovies extends StatelessWidget {
  const TopRatedMovies({super.key, required this.topRatedMovies});

  final List topRatedMovies;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(text: 'Top Rated Movies',color: Colors.white,size: 20,),
          SizedBox(height: 15,),
          Container(
            height: 270,
            child: ListView.builder( scrollDirection: Axis.horizontal,itemCount:topRatedMovies.length,itemBuilder: (context,index){
              return InkWell(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Description(
                            name: topRatedMovies[index]['title'],
                            bannerurl:
                            'https://image.tmdb.org/t/p/w500' +
                                topRatedMovies[index]['backdrop_path'],
                            posterurl:
                            'https://image.tmdb.org/t/p/w500' +
                                topRatedMovies[index]['poster_path'],
                            description: topRatedMovies[index]['overview'],
                            vote: topRatedMovies[index]['vote_average']
                                .toString(),
                            launchOn: topRatedMovies[index]
                            ['release_date'],
                          )));
                },
                child: Container(
                  width: 140,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500/'+topRatedMovies[index]['poster_path'],
                                )
                            )
                        ),
                        height: 200,
                      ),
                      SizedBox(height: 5,),
                      Container(
                        child: CustomText(text: topRatedMovies[index]['title']!=null?topRatedMovies[index]['title']:'loading',color: Colors.white,size: 15,),
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
