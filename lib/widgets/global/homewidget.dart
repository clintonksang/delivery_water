
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:water_del/provider/delmodel.dart';

// class DatabaseService {

// Future<List<Merchant>> fetchQuestions(String userId) async {
//   //   final questions = new List<Merchant>();
//   //   final doc = await FirebaseFirestore.instance.collection('merchants').get();
//   //   // final questionsTmp = doc.data().questions;
//   //   questionsTmp.forEach((questionTmp) {
//   //     questions.add(Merchant.fromJson(questionTmp));
//   //   });
//   //   return questions;
//   // }
// }

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

import 'package:provider/provider.dart';
import 'package:water_del/models/models.dart';
import 'package:water_del/provider/auth_provider.dart';
import 'package:water_del/provider/database_provider.dart';
import 'package:water_del/screens/Home/mapwidget.dart';
import 'package:water_del/screens/Home/profilePage.dart';
import 'package:water_del/screens/Home/supplier/supplier_home.dart';
import 'package:water_del/screens/constants.dart';
import 'package:water_del/utilities/utilities.dart';
import 'package:water_del/widgets/global/Recent_transactions.dart';


class HomeMain2 extends StatefulWidget {

  @override
  _HomeMain2State createState() => _HomeMain2State();
}

//  1a1f24
class _HomeMain2State extends State<HomeMain2> {


  DatabaseProvider _databaseProvider = DatabaseProvider();


  @override
  Widget build(BuildContext context) {
    // Provider.of<OrderModel>(context).client = userCurrent.uid;
    return 
     SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50, ),
              
              child:
               Container(
                height: 800,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // User Image
               

                    //  Good Morning
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Text(
                              _databaseProvider.greetingMessage(),
                              style: TextStyle(
                                  fontSize: 28,
                                  fontFamily: 'Lexend Deca',
                                  color: Colors.grey[800],
                                  fontWeight: FontWeight.w700),
                            ),
                          )
                        ],
                      ),
                    ),
                    // //  Name
                    // Padding(
                    //   padding: EdgeInsets.fromLTRB(20, 0, 20, 16),
                    //   child: Row(
                    //     mainAxisSize: MainAxisSize.max,
                    //     children: [
                    //       Padding(
                    //         padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    //         child: Text(
                    //           userCurrent.displayname[0],
                    //           style: TextStyle(
                    //               fontSize: 28,
                    //               fontFamily: 'Lexend Deca',
                    //               color: Colors.blue,
                    //               fontWeight: FontWeight.w700),
                    //         ),
                    //       ),
                    //       Padding(
                    //         padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                    //         child: Text(
                    //           "👋🏿",
                    //           style: TextStyle(
                    //               fontSize: 28, fontWeight: FontWeight.w700),
                    //         ),
                    //       )
                    //     ],
                    //   ),
                    // ),
                    //  Map
                      HomeMap(),
                    //  Recent
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 25, 0, 0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                           " Recent",
                          style: TextStyle(
                              fontSize: 28,
                              fontFamily: 'Lexend Deca',
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 16, 15, 6),
                      child: Recent(),
                    ),

                  //   No products 
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 15, 0, 0),
                      child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "No Recent transactions \n They'll show up here",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Lexend Deca',
                                color: kgrey,
                                fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
     );
    // clientPage();
  }
}
