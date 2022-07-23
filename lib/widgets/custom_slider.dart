import 'package:flutter/material.dart';

class CustomSlider extends StatelessWidget {
  final List<dynamic>movies;
  const CustomSlider(
    {
      Key? key,
      required this.movies, 
      }
      ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const base = "https://image.tmdb.org/t/p/w500";
    return Container(
      width: double.infinity,
      height: size.height,
      color: const Color(0xFF2e305F),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            ), 
            Expanded(
              child: ListView.builder (
                padding: const EdgeInsets.only(top: 10.0,bottom: 5.0),
                scrollDirection: Axis.horizontal,
                itemCount: movies.length,
                itemBuilder: (_, int index) {
                    final movie = movies[index];
                    final imageURL = base + movie["poster_path"];
                    final title = movie["original_title"];
                    return SizedBox(
                      width: size.width*0.4,
                      height: size.height*0.3,
                      child: Column(
                        children: [
                          FadeInImage(
                              placeholder:
                                  const AssetImage('assets/placeholder.jpg'),
                              image: NetworkImage(imageURL),
                              fit: BoxFit.cover),
                          Text(title,style: const TextStyle(fontSize: 13,color: Colors.white),),
                        ],
                      ),
                    );
                }
              )
              )
        ],
      ),
    );
  }
}