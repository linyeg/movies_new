import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CardSwiper extends StatelessWidget {
  final List<dynamic>movies;
  const CardSwiper(
    {
      Key? key,
      required this.movies
      }
      ) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const base = "https://image.tmdb.org/t/p/w500";
    return SizedBox(
      width: double.infinity,
      height: size.height,
      child: Swiper(
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemHeight: size.height,
        itemWidth: size.width*0.7,
        itemBuilder: (_,int index){
          final movie = movies[index];
          final imageURL = base + movie["poster_path"];
          return ClipRRect(
              child: FadeInImage(
                placeholder: const AssetImage('assets/placeholder.jpg'), 
                image: NetworkImage(imageURL),
                fit:BoxFit.cover
                ),  
            );
        },
      ),
    );
  }
}