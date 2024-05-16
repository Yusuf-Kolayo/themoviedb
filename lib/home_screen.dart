


import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:themoviedb/Api/moviesApi.dart';



class HomeScreen extends StatefulWidget {
  static String routeName = "/home_screen";

 const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
final TextEditingController searchController = TextEditingController();
// one must always be true, means selected.
List <bool> isSelected = [true, false];

// Map <int, Map<String, String>> movies = {
//     0: {
//           'title': 'Dune: Part Two',
//           'img': 'https://media.themoviedb.org/t/p/w220_and_h330_face/8b8R8l88Qje9dn9OE8PY05Nxl1X.jpg',
//           'score': '85%',
//           'date': 'Feb 27, 2024'
//         },
//     1: {
//           'title': 'Argylle',
//           'img': 'https://media.themoviedb.org/t/p/w220_and_h330_face/aOOvtA7OINVbARaN09Mnuv8DGB.jpg',
//           'score': '61%',
//           'date': 'Jan 31, 2024'
//        },
//     2: {
//           'title': 'The Regime',
//           'img': 'https://media.themoviedb.org/t/p/w220_and_h330_face/ztqPixNyezY6pWSNIP2AlhwPMO0.jpg',
//           'score': '80%',
//           'date': 'Mar 03, 2024'
//        }
// };


 List<Map<String, String>> movies = [
      {
          'title': 'Dune: Part Two',
          'img': 'https://media.themoviedb.org/t/p/w220_and_h330_face/8b8R8l88Qje9dn9OE8PY05Nxl1X.jpg',
          'score': '85%',
          'date': 'Feb 27, 2024'
        },
      {
          'title': 'Argylle',
          'img': 'https://media.themoviedb.org/t/p/w220_and_h330_face/aOOvtA7OINVbARaN09Mnuv8DGB.jpg',
          'score': '61%',
          'date': 'Jan 31, 2024'
       },
      {
          'title': 'The Regime',
          'img': 'https://media.themoviedb.org/t/p/w220_and_h330_face/ztqPixNyezY6pWSNIP2AlhwPMO0.jpg',
          'score': '80%',
          'date': 'Mar 03, 2024'
       }
];

@override
Widget build(BuildContext context) {
	return Scaffold(
	appBar: AppBar(
		title: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: SvgPicture.asset(
                  "assets/images/logo-1.svg",
                  color:  Colors.cyan.shade100,
                  width: 50,
                ),
          ),
        ),
    actions: <Widget>[
        IconButton(
            icon: const Icon(Icons.account_circle_sharp),
            tooltip: 'Comment Icon',
            onPressed: () {},
          ), //IconButton
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Setting Icon',
            onPressed: () {},
          )
    ],
		backgroundColor: Colors.cyan.shade700,
	),
	body: SingleChildScrollView(
      child: Column(
        children: [

          Stack(
            children: [
                  Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/app-banner-1.png'),
                          // scale: 0.1  
                          fit: BoxFit.cover
                        )
                      ),
                      height: 450,
                  ),
                  SizedBox(
                    height: 450,
                    //  color: Colors.amberAccent,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                      child: Column(
                          children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text('Welcome.', style: GoogleFonts.kdamThmorPro(
                                  color: Colors.white,
                                  fontSize: 50
                                )),
                              ),
                              Text('Millions of movies,Tv shows and people to discover. Explore now.', style: GoogleFonts.lato(
                                color: Colors.white,
                                fontSize: 39
                              )), 
                              const SizedBox(height: 25),
                              Container(
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(40), color: Colors.white),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 230,
                                      padding: const EdgeInsets.symmetric( horizontal: 25, vertical:5),
                                      child: TextFormField(
                                        controller: searchController,
                                        keyboardType: TextInputType.text,
                                        decoration: const InputDecoration(
                                          hintText: "Search....",
                                          hintStyle: TextStyle(color: Colors.black)
                                      ),
                                      ),
                                      ),
                                    const Spacer(),
                                    Container(
                                      decoration: BoxDecoration(color: Colors.cyan.shade400, borderRadius: BorderRadius.circular(40)),
                                      padding: const EdgeInsets.all(20),
                                      child: const Text('Search', style: TextStyle(fontSize: 16, color: Colors.white),),
                                    )
                                  ],
                                ),
                              )
                          ],
                      ),
                    ),
                  )
            ],
          ),

          Container(
            //  height: 400,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
                children: [
                    Row(
                      children: [
                          const Padding(
                            padding:  EdgeInsets.only(right: 20),
                            child:  Text('Trending', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                          ),
                          ToggleButtons(
                            direction:Axis.vertical,
                            // list of booleans
                            isSelected: isSelected,
                            // text color of selected toggle
                            selectedColor: Colors.white,
                            // text color of not selected toggle
                            color: Colors.blue,
                            // fill color of selected toggle
                            fillColor: Colors.lightBlue.shade900,
                            // when pressed, splash color is seen
                            splashColor: Colors.cyan,
                            // long press to identify highlight color
                            highlightColor: Colors.lightBlue.shade900,
                            // if consistency is needed for all text style
                            textStyle: const TextStyle(fontWeight: FontWeight.bold),
                            // border properties for each toggle
                            renderBorder: true,
                            borderColor: Colors.black,
                            borderWidth: .5,
                            borderRadius: BorderRadius.circular(10),
                            selectedBorderColor: Colors.cyan,
                            // add widgets for which the users need to toggle
                            children: const [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                                child: Text('Today', style: TextStyle(fontSize: 15)),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                                child: Text('This week', style: TextStyle(fontSize: 15)),
                              )
                            ],

                            // to select or deselect when pressed
                            onPressed: (int newIndex) {
                              setState(() {
                                // looping through the list of booleans values
                                for (int index = 0; index < isSelected.length; index++) {
                                  if (index == newIndex) {
                                    // toggling between the button to set it to true
                                    isSelected[index] = !isSelected[index];
                                  } else {
                                    // other two buttons will not be selected and are set to false
                                    isSelected[index] = false;
                                  }
                                }
                              });
                            },
                          )
                      ],
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 300,
                      // width: 400,
                      child: ListView.builder(
                          itemCount: 3,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              padding: const EdgeInsets.only(right: 15),
                              child: Column(
                                children: [
                                    Container(
                                        height: 300,
                                        width: 200,
                                        // padding: EdgeInsets.symmetric(horizontal: 40),
                                        decoration:  BoxDecoration(
                                          image: DecorationImage (
                                            image: NetworkImage(movies[index]['img']!), // Replace with the URL of your network image
                                            fit: BoxFit.contain, // Adjust the fit as needed
                                          ),
                                        ),
                                      )
                                ],
                              ),
                            );
                          }
                        ),
                    ),

                    const SizedBox(height: 20),
                    FutureBuilder(
                      future: MoviesApi().loadHomeData(), 
                      builder:(context, snapshot) {
                          return const Center();
                      },
                    )
      
                ],
            ),
          )
          
        ],
      ),
  ),
	drawer: Drawer(
		child: ListView(
		padding: const EdgeInsets.all(0),
		children: [
			 
			ListTile(
			leading: const Icon(Icons.movie),
			title: const Text(' Movies '),
			onTap: () {
				Navigator.pop(context);
			},
			),
			ListTile(
			leading: const Icon(Icons.video_collection),
			title: const Text(' TV Shows '),
			onTap: () {
				Navigator.pop(context);
			},
			),
			ListTile(
			leading: const Icon(Icons.people),
			title: const Text(' People '),
			onTap: () {
				Navigator.pop(context);
			},
			),
			ListTile(
			leading: const Icon(Icons.book_rounded),
			title: const Text(' Contribution bible '),
			onTap: () {
				Navigator.pop(context);
			},
			),
			ListTile(
			leading: const Icon(Icons.chat_rounded),
			title: const Text(' Discussions '),
			onTap: () {
				Navigator.pop(context);
			},
			),
			ListTile(
			leading: const Icon(Icons.leaderboard_rounded),
			title: const Text('Leaderboard'),
			onTap: () {
				Navigator.pop(context);
			},
			),
      ListTile(
			leading: const Icon(Icons.api_sharp),
			title: const Text('API'),
			onTap: () {
				Navigator.pop(context);
			},
			),
      ListTile(
			leading: const Icon(Icons.support_agent_sharp),
			title: const Text('Support'),
			onTap: () {
				Navigator.pop(context);
			},
			),
      ListTile(
			leading: const Icon(Icons.content_paste_go_sharp),
			title: const Text('About'),
			onTap: () {
				Navigator.pop(context);
			},
			),
      ListTile(
			leading: const Icon(Icons.login_sharp),
			title: const Text('Login'),
			onTap: () {
				Navigator.pop(context);
			},
			),
		],
		),
	), //Drawer
	);
}
}
