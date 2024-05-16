import 'package:flutter/material.dart';
import 'package:themoviedb/constants.dart';
import 'package:themoviedb/routes.dart';
import 'package:themoviedb/sign_in_screen.dart';



void main() async {
   WidgetsFlutterBinding.ensureInitialized();
   ErrorWidget.builder = (FlutterErrorDetails details) => Container();
    runApp ( const MyApp() );
}






class MyApp extends StatelessWidget  {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var myLocale = const Locale('en', 'NG'); 
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: myLocale,
      title: 'BN LAG',
       theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: primaryColor,
        fontFamily: 'Georgia',
        textTheme:  const TextTheme(
          displayLarge: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(fontSize: 30.0, fontStyle: FontStyle.italic),
          bodyMedium: TextStyle(fontSize: 18.0, fontFamily: 'Hind'),
        ),
        ),
      // home: SplashScreen(),
      // We use routeName so that we dont need to remember the name
      initialRoute: SignInScreen.routeName,
      routes: routes,
    );
  }
}





// import 'package:flutter/material.dart'; 

// void main() { 
// runApp(MyApp()); 
// } 

// class MyApp extends StatelessWidget { 
// @override 
// Widget build(BuildContext context) { 
// 	return MaterialApp( 
// 	theme: ThemeData( 
// 		primarySwatch: Colors.green, 
// 	), 
// 	debugShowCheckedModeBanner: false, 

// 	home: MyListView(), 
// 	); 
// } 
// } 

// class MyListView extends StatelessWidget { 
// @override 
// Widget build(BuildContext context) { 
// 	return Scaffold( 
// 	appBar: AppBar( 
// 		title: Text('ListView with Options Menus'), 
// 	), 
// 	body: Column( 
// 		children: <Widget>[ 
// 		Expanded( 
// 			child: ListView( 
// 			children: <Widget>[ 
// 				// Create a ListView with a list of items, 
// 				// each having a PopupMenuButton 
// 				for (int i = 1; i <= 5; i++) 
// 				ListTile( 
// 					title: Text("List Item $i"), 
// 					trailing: PopupMenuButton<int>( 
// 					onSelected: (value) { 
// 						// Handle the selection from the PopupMenuButton 
// 						if (value == 0) { 
// 						_showSnackbar(context, "Option 1 selected"); 
// 						} else if (value == 1) { 
// 						_showSnackbar(context, "Option 2 selected"); 
// 						} 
// 					}, 
// 					itemBuilder: (BuildContext context) { 
// 						// Define the menu items for the PopupMenuButton 
// 						return <PopupMenuEntry<int>>[ 
// 						PopupMenuItem<int>( 
// 							value: 0, 
// 							child: Text("Option 1"), 
// 						), 
// 						PopupMenuItem<int>( 
// 							value: 1, 
// 							child: Text("Option 2"), 
// 						), 
// 						]; 
// 					}, 
// 					),
// 				), 
// 			], 
// 			), 
// 		), 
// 		], 
// 	), 
// 	); 
// } 

// // Display a Snackbar with the provided message 
// void _showSnackbar(BuildContext context, String message) { 
// 	ScaffoldMessenger.of(context).showSnackBar( 
// 	SnackBar( 
// 		content: Text(message), 
// 	), 
// 	); 
// } 
// } 


