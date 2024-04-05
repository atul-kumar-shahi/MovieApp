import 'package:flutter/material.dart';
import 'package:movie_app/widgets/topratedmovies.dart';
import 'package:movie_app/widgets/toptvshows.dart';
import 'package:movie_app/widgets/trending.dart';
import 'package:tmdb_api/tmdb_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override

  List trendingMovies=[];
  List topRatedMovies=[];
  List tvShows=[];


  final String apiKey = 'ed497ae1c8c9cbe9dd35583c65ccfd84';
  final String accessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlZDQ5N2FlMWM4YzljYmU5ZGQzNTU4M2M2NWNjZmQ4NCIsInN1YiI6IjY2MGVmYTdkZTAzOWYxMDE2MmU2OTNmZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.3b9K-JzLBn_kOn601BjwKuh1CtwX8_AFD0aTtmrbNfE';


  Future<void>fetchApi()async{
    final tmdbWithCustomLogs=TMDB(ApiKeys(apiKey,accessToken),
    logConfig: const ConfigLogger(
     showLogs: true,
     showErrorLogs: true,
    ));
    Map trendingResult=await tmdbWithCustomLogs.v3.trending.getTrending();
    Map movieResult=await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvResult=await tmdbWithCustomLogs.v3.tv.getPopular();

    setState(() {
      trendingMovies=trendingResult['results'];
      topRatedMovies=movieResult['results'];
      tvShows=tvResult['results'];

    });
    print(tvShows);

  }
  
  @override
  void initState() {
    super.initState();
    fetchApi();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie App'),
      ),
      body: ListView(
        children: [
          TopRatedMovies(topRatedMovies: topRatedMovies),
          TrendingMovies(trendingMovies:trendingMovies ),
          TopRatedTvShows(topRatedTvShows: tvShows),

        ],
      )
    );
  }
}
