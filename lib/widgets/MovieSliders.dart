import 'package:MovieFlixer/constants.dart';
import 'package:MovieFlixer/scenes/details_screen.dart';
import 'package:flutter/material.dart';

class Movie_Sliders extends StatelessWidget {
  const Movie_Sliders({
    super.key, required this.snapshot,
  });

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      itemCount: snapshot.data!.length,
      itemBuilder: (context, Index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: (){
              Navigator.push(
                context, MaterialPageRoute(
                  builder: (context) => Detail_screen(
                    movie: snapshot.data[Index],
                  ),
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
              height: 200,
              width: 150,
              child: Image.network(
                filterQuality: FilterQuality.high,
                fit: BoxFit.cover,
                '${Constants.imagePath}${snapshot.data![Index].posterPath}',
              ),
              ),
            ),
          ),
        );
      }
      ),
    );
  }
}