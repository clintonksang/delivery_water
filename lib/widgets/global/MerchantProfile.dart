import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MerchantProfile extends StatefulWidget {
  MerchantProfile({
    Key key,
    this.userProfile,
  }) : super(key: key);

  final DocumentReference userProfile;

  @override
  _MerchantProfileState createState() => _MerchantProfileState();
}

class _MerchantProfileState extends State<MerchantProfile> {

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    return   Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.grey[900],
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 1,
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 10, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 70, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color:Colors.blue,
                                    elevation: 2,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          2, 2, 2, 2),
                                      child: Container(
                                        width: 60,
                                        height: 60,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.asset(
                                          'assets/images/background.jpg',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Sammi Suppliers',
                                    style:TextStyle(
                                      
                                      fontFamily: 'Lexend Deca',
                                      fontSize: 15,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 0),
                                  child: Text(
                                    'sammi.name@majimtaani.com',
                                    style: TextStyle(
                                      fontFamily: 'Lexend Deca',
                                      color:Colors.blue,
                                       fontSize: 15,
                                      
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 50, 25, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Contact',
                                    style: TextStyle(
                                      fontFamily: 'Lexend Deca',
                                       fontSize: 15,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    '+254716123456',
                                    style: TextStyle(
                                      fontFamily: 'Lexend Deca',
                                       fontSize: 15,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 20, 25, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Rating',
                                    style: TextStyle(
                                      fontFamily: 'Lexend Deca',
                                       fontSize: 15,
                                      color: Colors.white,
                                    ),
                                  ),
                                  RatingBarIndicator(
                                    itemBuilder: (context, index) => Icon(
                                      Icons.star_rounded,
                                      color: Colors.orange[800],
                                    ),
                                    direction: Axis.horizontal,
                                    rating: 3,
                                    unratedColor: Color(0xFF9E9E9E),
                                    itemCount: 5,
                                    itemSize: 40,
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 24, 0, 20),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF503DF4),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 25, 0, 0),
                                      child: Text(
                                        'Rate',
                                        textAlign: TextAlign.center,
                                        style:
                                            TextStyle(
                                          fontFamily: 'Lexend Deca',
                                          color: Color(0xFFFAFDFF),
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
    // return StreamBuilder(
    // return StreamBuilder<UsersRecord>(
      // stream: UsersRecord.getDocument(currentUserReference),
      // builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
      //   if (!snapshot.hasData) {
      //     return Center(
      //       child: SizedBox(
      //         width: 40,
      //         height: 40,
      //         child: SpinKitPumpingHeart(
      //           color:Colors.blue,
      //           size: 40,
      //         ),
      //       ),
      //     );
      //   }
      //   final profilePageUsersRecord = snapshot.data;
      //   return 
      
      // },
    
  }
}