import 'package:flutter/material.dart';
import 'package:movies/providers/movies_provider.dart';
import 'package:movies/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Movies'),
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: const Icon(Icons.search_outlined))
        ],
      ),
      body: Stack(
        children: [
          const Background(),
          SingleChildScrollView(
          child: Column(
            children: [
              const Text('Latest movies',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
              CardSwiper(movies: moviesProvider.dataMovies),
              const Text("Popular", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),),
              CustomSlider(movies: moviesProvider.dataPopular),
              const Text('Top Rated',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
              CustomSlider(movies: moviesProvider.dataUpcoming)
            ],
            ),
        ),
        ]
      )
    );
  }
}