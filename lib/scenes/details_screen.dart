import 'package:MovieFlixer/constants.dart';
import 'package:MovieFlixer/models/movie.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Detail_screen extends StatelessWidget {
  const Detail_screen({super.key, required this.movie});
  final Movie_list movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
            Navigator.of(context).pop();
  },
),
      
            backgroundColor:  const Color.fromARGB(255, 94, 84, 72),
            expandedHeight: 400,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                movie.title, 
                style: GoogleFonts.belleza(
                fontSize: 20, 
                fontWeight: FontWeight.w400,
                ),
              ),
              background: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15)
                ),
                child: Image.network(
                  '${Constants.imagePath}${movie.backDropPath}',
                filterQuality: FilterQuality.high,
                fit: BoxFit.cover,
                ),
              ),
            ),
          ),
           SliverToBoxAdapter(
            child: Padding(
              padding:const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(
                'Overview of the Movie', 
                 style: GoogleFonts.openSans(
                fontSize: 20, 
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 0, 0, 0),
                ),
                ),
                const SizedBox(height: 14),
                Text(
                movie.overview,
                style: GoogleFonts.lato(
                fontSize: 15, 
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 0, 0),
                ),
                ),
                const SizedBox(height: 14),
                SizedBox(
                  child: Row(
                  children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(7)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Rating for the movie: ', 
                      style: GoogleFonts.openSans(
                      fontSize: 15, 
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                          const Icon(
                          Icons.star, 
                          color: Color.fromARGB(255, 0, 0, 0),
                          ),
                          Text('${movie.voteAverage.toStringAsFixed(1)}/10',
                           style: TextStyle(
                           color: const Color.fromARGB(255, 242, 66, 53
                           )),
                          ),

                        ],
                      ),
                    
                    ),
                    Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(7)
                    ),
                    child: Row(
                      children: [
                      Text(
                      'Release date: ',
                      style: GoogleFonts.openSans(
                      fontSize: 15, 
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0),
                      ),),
                      Text(
                      movie.releaseDate, 
                      style: GoogleFonts.openSans(
                      fontSize: 15, 
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      ),
                    ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(7)
                    ),
                    child: Row(
                      children: [
                      Text(
                      'Language: ',
                      style: GoogleFonts.openSans(
                      fontSize: 15, 
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0),
                      ),),
                      Text(
                      movie.original_language, 
                      style: GoogleFonts.openSans(
                      fontSize: 15, 
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      ),
                    ],
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(7)
                    ),
                    child: Row(
                      children: [
                      Text(
                      'Vote Average:  ',
                      style: GoogleFonts.openSans(
                      fontSize: 15, 
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0),
                      ),),
                      Text(
                       '${movie.voteAverage}',
                      style: GoogleFonts.openSans(
                      fontSize: 15, 
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      ),
                    ],
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(7)
                    ),
                    child: Row(
                      children: [
                      Text(
                      'Popularity of the movie:  ',
                      style: GoogleFonts.openSans(
                      fontSize: 15, 
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0),
                      ),),
                      Text(
                       '${movie.popularity}',
                      style: GoogleFonts.openSans(
                      fontSize: 15, 
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      ),
                    ],
                    ),
                  ),
                
                ],
                ),
                ),
             ], 
            ),
            )
          )
        ],
      ),
    );
  }
}

