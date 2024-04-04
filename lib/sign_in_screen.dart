import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:themoviedb/api.dart';
import 'package:themoviedb/size_config.dart';
import 'package:url_launcher/url_launcher.dart';



class SignInScreen extends StatefulWidget {
  static String routeName = "/sign_in";

  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool btnSignIn = true;

  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);



    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
      ),
      body: SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: getProportionateScreenHeight(200)),
                Text(
                  "THE MOVIE DB",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: getProportionateScreenWidth(10)),
                const Text(
                  "Service At Your Convenience",
                  style: TextStyle(fontSize: 19),   //  \nor continue with social media
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: getProportionateScreenWidth(40)),

                Visibility(
                  visible: (btnSignIn==true),
                  child: TextButton(
                    onPressed: () async {
                        dynamic result = await Api().createNewRequestToken();
                        String requestToken = '';
                       if  (result['success']==true) { 
                            requestToken = result['request_token'];
                             log(requestToken.toString());
                             
                             setState(() {
                                  btnSignIn=false;
                             });
                              Uri url = Uri(scheme: 'https', path:'www.themoviedb.org/authenticate/$requestToken');
                              if (await canLaunchUrl(url)) {
                                await launchUrl(url);
                              } else {
                                throw 'Could not launch address';
                              }

                
                       } else {
                            
                              // ignore: use_build_context_synchronously
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                content: Text("Something went wrong ...",
                            )));
                            
                       }
                    }, 
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.cyan.shade800), 
                      foregroundColor: const MaterialStatePropertyAll(Colors.white),
                      minimumSize: MaterialStatePropertyAll(Size(getProportionateScreenWidth(200), getProportionateScreenHeight(40)))
                    ),
                    child: const Text('Sign In', style: TextStyle(fontSize: 15),)
                  ),
                ),
                
                
                 Visibility(
                   visible: (btnSignIn==false),
                   child: TextButton(
                    onPressed: () async {
                        dynamic result = await Api().createSessionID();
                        String sessionID = '';  
                       if  (result['success']==true) {
                            log(result.toString());
                            sessionID = result['session_id'];
                             log(sessionID.toString());
                             
                       } else {
                              // ignore: use_build_context_synchronously
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                content: Text("Something went wrong ...",
                            )));
                       }
                    }, 
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.cyan.shade800), 
                      foregroundColor: const MaterialStatePropertyAll(Colors.white),
                      minimumSize: MaterialStatePropertyAll(Size(getProportionateScreenWidth(200), getProportionateScreenHeight(40)))
                    ),
                    child: const Text('Confirm Sign In', style: TextStyle(fontSize: 15),)),
                 ),
                
                SizedBox(height: getProportionateScreenWidth(35)),  
              ],
            ),
          ),
        ),
      ),
    )
    );
  }
}