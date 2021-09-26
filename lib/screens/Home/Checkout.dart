import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:water_del/screens/Home/SuccessWisget.dart';
import 'package:water_del/utilities/utilities.dart';

class CheckoutWidget extends StatefulWidget {
  // call constructor
  CheckoutWidget({Key key, counter, price}) : super(key: key);
  @override
  _CheckoutWidgetState createState() => _CheckoutWidgetState();
}

class _CheckoutWidgetState extends State<CheckoutWidget> {
//  get value of counter and price to display in the widget



  var amount ; 

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
  }

  //
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF1A1F24),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () async {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF95A1AC),
            size: 30,
          ),
          iconSize: 28,
        ),
        title: Text(
          'My Cart',
          style:TextStyle(
            fontFamily: 'Lexend Deca',
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: Color(0xFFF1F5F8),
      body: SafeArea(
        child: SingleChildScrollView(
                  child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 2,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: Color(0xFF1A1F24),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(1, 0, 0, 0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [

                          // Card 1
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.96,
                                  height: 120,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4,
                                        color: Color(0x3A000000),
                                        offset: Offset(0, 2),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 0,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                8, 0, 0, 0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: Image.asset(
                                                'assets/images/waterdel.png',
                                                width: 74,
                                                height: 74,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              12, 0, 0, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '[Product Name]',
                                                style: TextStyle(
                                                  fontFamily: 'Lexend Deca',
                                                  color: Color(0xFF111417),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsetsDirectional.fromSTEB(
                                                        0, 8, 0, 0),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                   // write short code to display red remove button
                                                    Container(
                                                      
                                                      width: MediaQuery.of(context).size.width * 0.3,
                                                      height: 30,
                                                      decoration: BoxDecoration(
                                                        color: Colors.red,
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                8),
                                                                
                                                            ),
                                                            child: Center(
                                                              child: Text('Clear Cart',
                                                              style: TextStyle(color: Colors.white,
                                                              
                                                              ),
                                                              ),
                                                            )),
                                                  
                                                   
                                                   
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 0, 16, 0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment.end,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Text(
                                                              '[Price]',
                                                              style:
                                                                  TextStyle(
                                                                fontFamily:
                                                                    'Lexend Deca',
                                                                color: Color(
                                                                    0xFF151B1E),
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight.w500,
                                                              ),
                                                            )
                                                          ],
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
                                )
                              ],
                            ),
                          ),
                         
                         //  Card 2
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.96,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: Color(0x3A000000),
                                    offset: Offset(0, 2),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 16, 16, 12),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Order Summary',
                                          style:
                                              TextStyle(
                                            fontFamily: 'Lexend Deca',
                                            color: Color(0xFF090F13),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 12, 16, 16),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Total',
                                          style:
                                              TextStyle(
                                            fontFamily: 'Lexend Deca',
                                            color: Color(0xFF8B97A2),
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                        Text(
                                          '[Order Total]',
                                          textAlign: TextAlign.end,
                                          style:
                                             TextStyle(
                                            fontFamily: 'Lexend Deca',
                                            color: Color(0xFF151B1E),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Divider(
                            height: 2,
                            thickness: 1,
                            indent: 16,
                            endIndent: 16,
                            color: Colors.transparent,
                          ),

                          // Mpesa Payment
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 10),
                            child: Material(
                              color: Colors.transparent,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Container(
                                width: 320,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Image.asset(
                                  'assets/images/mpesa-logo.png',
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                          
                          
                          
                          GestureDetector(
                            onTap: ()async{

              Navigator.of(context)
                  .push(ScaleRoute(page: SuccessWidget()));
          },
                                                      child: Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Container(
                                  width: 320,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Colors.purple,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Text(
                                    'Pay',
                                    style: TextStyle(
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
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }}