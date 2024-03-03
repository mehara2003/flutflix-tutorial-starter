import 'package:flutter/material.dart';
import 'package:MovieFlixer/api/api.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/movie.dart';
import 'widgets/MovieSliders.dart';
import 'widgets/TrendingSlider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
@override

late Future<List<Movie_list>> trending_Movies; 
late Future<List<Movie_list>> topRated_Movies;
late Future<List<Movie_list>> Upcoming_Movies;
late Future<List<Movie_list>> NowPlaying_Movies;
late Future<List<Movie_list>> Kids_Movies;
late Future<List<Movie_list>> Kids_ActionMovies;


@override
void initState() {
  super.initState();
  trending_Movies = Api().getTrendingMovies();
  topRated_Movies = Api().getTopRatedMovies();
  Upcoming_Movies = Api().getUpcomingMovies();
  NowPlaying_Movies = Api().getNowPlayingMovies();
  Kids_Movies = Api().getkidsMovies();
  Kids_ActionMovies = Api().getActionKidsMovies();

}
 
    searchbar(){

    }


  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Image.asset(
        'assets/movie LOGO.png', 
        fit: BoxFit.cover,
        height: 88,
        filterQuality:FilterQuality.high,
        ),
      centerTitle: true,
     ),
     body: SingleChildScrollView (
      physics:const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Trending Movies', 
              style:GoogleFonts.aBeeZee(fontSize: 28, color: Colors.black),
              ),
              const SizedBox(height:8),
              SizedBox(
                child: FutureBuilder(
                  future: trending_Movies,
                  builder: (context, snapshot ){
                    if (snapshot.hasError){
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if(snapshot.hasData){
                      return Trending_Slider(snapshot: snapshot,);
                    } else {
                      return const Center(child:
                       CircularProgressIndicator());
                    }
                  }
                ),
              ),


              const SizedBox (height: 28),
              Text('Top Rated Movies', style: GoogleFonts.aBeeZee(
                fontSize: 25,
                color: Colors.black
                ),
              ),
              
              const SizedBox(height: 28),
              SizedBox(
                child: FutureBuilder(
                  future: topRated_Movies,
                  builder: (context, snapshot ){
                    if (snapshot.hasError){
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if(snapshot.hasData){
                      return Movie_Sliders(snapshot: snapshot,);
                    } else {
                      return const Center(child:
                       CircularProgressIndicator());
                    }
                  }
                ),
              ),


              const SizedBox (height: 28),
              Text('Upcoming Movies', style: GoogleFonts.aBeeZee(
                fontSize: 25,
                color: Colors.black
                ),
              ),

              SizedBox(
                child: FutureBuilder(
                  future: Upcoming_Movies,
                  builder: (context, snapshot ){
                    if (snapshot.hasError){
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if(snapshot.hasData){
                      return Movie_Sliders(snapshot: snapshot,);
                    } else {
                      return const Center(child:
                       CircularProgressIndicator());
                    }
                  }
                ),
              ),            

               const SizedBox (height: 28),
              Text('Now Playing', style: GoogleFonts.aBeeZee(
                fontSize: 25,
                color: Colors.black
                ),
              ),
              
              const SizedBox(height: 28),
              SizedBox(
                child: FutureBuilder(
                  future: NowPlaying_Movies,
                  builder: (context, snapshot ){
                    if (snapshot.hasError){
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if(snapshot.hasData){
                      return Movie_Sliders(snapshot: snapshot,);
                    } else {
                      return const Center(child:
                       CircularProgressIndicator());
                    }
                  }
                ),
              ),  

              const SizedBox (height: 28),
              Text('Kids Movies', style: GoogleFonts.aBeeZee(
                fontSize: 25,
                color: Colors.black
                ),
              ),
              
              const SizedBox(height: 28),
              SizedBox(
                child: FutureBuilder(
                  future: Kids_Movies,
                  builder: (context, snapshot ){
                    if (snapshot.hasError){
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if(snapshot.hasData){
                      return Movie_Sliders(snapshot: snapshot,);
                    } else {
                      return const Center(child:
                       CircularProgressIndicator());
                    }
                  }
                ),
              ),  

              const SizedBox (height: 28),
              Text('Action Child friendly Movies', style: GoogleFonts.aBeeZee(
                fontSize: 25,
                color: Colors.black
                ),
              ),
              
              const SizedBox(height: 28),
              SizedBox(
                child: FutureBuilder(
                  future: Kids_ActionMovies,
                  builder: (context, snapshot ){
                    if (snapshot.hasError){
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if(snapshot.hasData){
                      return Movie_Sliders(snapshot: snapshot,);
                    } else {
                      return const Center(child:
                       CircularProgressIndicator());
                    }
                  }
                ),
              ),  

              const SizedBox(height: 29),
              
                     
          ],
        ),
      ),
     ),
    );
  }
}



