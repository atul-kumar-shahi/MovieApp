import 'package:flutter/material.dart';

import '../discription.dart';
import '../utils/custom_text.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({super.key, required this.trendingMovies});

  final List trendingMovies;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(text: 'Trending Movies',color: Colors.white,size: 20,),
          SizedBox(height: 15,),
          Container(
            height: 270,
            child: ListView.builder( scrollDirection: Axis.horizontal,itemCount:trendingMovies.length,itemBuilder: (context,index){
              return InkWell(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Description(
                            name: trendingMovies[index]['title'],
                            bannerurl:
                            'https://image.tmdb.org/t/p/w500' +
                                trendingMovies[index]['backdrop_path'],
                            posterurl:
                            'https://image.tmdb.org/t/p/w500' +
                                trendingMovies[index]['poster_path'],
                            description: trendingMovies[index]['overview'],
                            vote: trendingMovies[index]['vote_average']
                                .toString(),
                            launchOn: trendingMovies[index]
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
                            'https://image.tmdb.org/t/p/w500/'+trendingMovies[index]['poster_path'],
                          )
                        )
                       ),
                      height: 200,
                      ),
                    SizedBox(height: 5,),

                    Container(
                      child: CustomText(text: trendingMovies[index]['title']!=null?trendingMovies[index]['title']:'loading',color: Colors.white,size: 15,),
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
