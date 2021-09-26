
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:water_del/screens/Authentication/merchantservices.dart';

class SuccessWidget extends StatefulWidget {
  SuccessWidget({Key key}) : super(key: key);

  @override
  _SuccessWidgetState createState() => _SuccessWidgetState();
}

class _SuccessWidgetState extends State<SuccessWidget> {
  final pageViewController = PageController();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF14181B),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Processing',
                  style:TextStyle(
                    fontFamily: 'Lexend Deca',
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: Stack(
                    children: [
                      PageView(
                        controller: pageViewController,
                        scrollDirection: Axis.horizontal,
                        children: [
                          Expanded(
                                                      child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  LottieBuilder.asset(
                                    'assets/lottie/payment.json',
                                    width: 150,
                                    height: 130,
                                    fit: BoxFit.cover,
                                    repeat: false,
                                    animate: true,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 0, 20, 8),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Processing',
                                            textAlign: TextAlign.center,
                                            style:
                                                TextStyle(
                                              fontFamily: 'Lexend Deca',
                                              color: Colors.white,
                                              fontSize: 32,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 0, 20, 8),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Kindly Wait as we process your transaction',
                                            textAlign: TextAlign.center,
                                            style: TextStyle
                                                (
                                              fontFamily: 'Lexend Deca',
                                              color: Color(0x99FFFFFF),
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
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
                      ),
              
                    ],
                  ),
                ),
              )
            ],
          ),
          Material(
            color: Colors.transparent,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Container(
              width: 200,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8),
              ),
              child: 
              GestureDetector
              (
                // Navigate to MarkersMap page with no return when tapped and dispose the current page
                onTap: () {
                  Navigator.pushReplacement(context, 
                  MaterialPageRoute(builder: (context) => MarkersMap()));
                  
                  // dispose the current page
                  pageViewController.dispose();
                  super.dispose();

                },

                              child: Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Text(
                    'Go to Home',
                    style:TextStyle(
                      fontFamily: 'Lexend Deca',
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }}