


import 'dart:core';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:themoviedb/Models/movies.dart';
import 'package:themoviedb/app_bar.dart';
import 'package:themoviedb/drawer.dart';
import 'package:themoviedb/size_config.dart';


class MovieDetailScreen extends StatefulWidget {

  static String routeName = "/movie_detail_screen";
  const MovieDetailScreen({Key? key}) : super(key: key);

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {

@override
Widget build(BuildContext context) {
  
   // Retrieve the arguments passed from the previous screen
      final Map<String, dynamic> args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>? ?? {};
      final Movie movie                = args['movie']; 
      log(movie.backdropPath.toString());


	return Scaffold(
	appBar: appBar(),
	body: SingleChildScrollView(
      child: Column(
        children: [

          Stack(
            children: [
                  Container(
                      decoration: BoxDecoration(
                        image: movie.backdropPath==null ? const DecorationImage(
                          image:  AssetImage('images/placeholder-1.jpg'),
                          fit: BoxFit.cover,
                        ) : DecorationImage(
                          image: NetworkImage(movie.backdropPath!),
                          fit: BoxFit.cover,
                        )
                      ),
                      height: 250,
                  ),
                  Container(
                      decoration: const BoxDecoration(
                        color:  Color.fromRGBO(40, 137, 156, 0.757)
                      ),
                      height: 250,
                  ),
                  // ignore: sized_box_for_whitespace
                  Container(
                    height: 250,
                    //  color: Colors.amberAccent,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                      child: Row(
                          children: [
                                  Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(movie.posterPath),
                                          // scale: 0.1  
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.circular(10)
                                      ),
                                      height: 250,
                                      width: 140,
                                  ),
                                  const Spacer(flex: 2)
                          ],
                      ),
                    ),
                  )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 10, right: 20, left: 20),
            child: Text(
              movie.originalTitle,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27, color: Colors.cyan.shade800)),
          ),
          Container(
            padding: const EdgeInsets.only(top: 30, bottom: 30, right: 20, left: 20),
            decoration: BoxDecoration(color: Colors.cyan.shade800),
            child: Text(
              movie.overview,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 18, color: Colors.white)),
          )


        
          
        ],
      ),
  ),

	drawer: drawer(context), //Drawer
	);
}
}
