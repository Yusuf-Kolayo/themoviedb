import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:themoviedb/Models/search.dart';
import 'package:themoviedb/size_config.dart';

AppBar appBar () {
 
   TextEditingController txtController = TextEditingController();

   Container searchTxtField() {
    // ignore: sized_box_for_whitespace
    return Container(
      width: getProportionateScreenWidth(300),
      child: TextField(
         controller: txtController,
         cursorColor: Colors.white,
         decoration: const InputDecoration(focusColor: Colors.white),
         style: const TextStyle(color: Colors.white),
         onChanged: (value) {
           
         },
         onSubmitted: (value) {
            log(value);
         },
      ),
    );
   }


   Row defaultRowBar () {
    return Row(
        children: [
          const Spacer(),
          SvgPicture.asset(
                "assets/images/logo-1.svg",
                color:  Colors.cyan.shade100,
                width: 50,
              ),
          const Spacer(),
        ],
      );
   }



   return AppBar(
		title: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 30),
            child:   Consumer(
            builder: (context, ref, child) {
              bool searchBool = ref.watch(searchBooleanProvider);
              if (searchBool) {
                 return searchTxtField();
              } else {
                return defaultRowBar();
              }           
            },
          ),
          ),
        ),
    actions: <Widget>[ 
          Consumer(
            builder: (context, ref, child) {
              bool searchBool = ref.watch(searchBooleanProvider);
              if (searchBool) {
                  return IconButton(
                    icon: const Icon(Icons.cancel_outlined),
                    tooltip: 'Cancel Icon',
                    onPressed: () {
                        ref.read(searchBooleanProvider.notifier).state = false;
                    },
                  );
              } else {
                   return IconButton(
                      icon: const Icon(Icons.search),
                      tooltip: 'Search Icon',
                      onPressed: () {
                          ref.read(searchBooleanProvider.notifier).state = true;
                      },
                  );
              }           
            },
          )
    ],
		backgroundColor: Colors.cyan.shade700,
	);
}