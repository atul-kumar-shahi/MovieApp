import 'package:flutter/material.dart';
import 'package:movie_app/utils/custom_text.dart';

class Description extends StatelessWidget {
  const Description(
      {super.key, required this.name, required this.description, required this.bannerurl, required this.posterurl, required this.vote, required this.launchOn});

  final String name, description, bannerurl, posterurl, vote, launchOn;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(children: [
          Container(
              height: 250,
              child: Stack(children: [
                Positioned(
                  child: Container(
                    height: 250,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    child: Image.network(
                      bannerurl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                    bottom: 10,
                    child: Text( '⭐ Average Rating - ' + vote)),
              ])),
          SizedBox(height: 15),
          Container(
              padding: EdgeInsets.all(10),
              child:CustomText(text:name!= null?name : 'Not Loaded',size: 24,color: Colors.white,)),
          Container(
              padding: EdgeInsets.only(left: 10),
              child:
              CustomText(text:'Releasing On -  + $launchOn',size: 14,color: Colors.white),),
          Row(
            children: [
              Container(
                height: 200,
                width: 100,
                child: Image.network(posterurl),
              ),
              Flexible(
                child: Container(
                    padding: EdgeInsets.all(10),
                    child: CustomText(text: description, size: 18,color: Colors.white,)),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
