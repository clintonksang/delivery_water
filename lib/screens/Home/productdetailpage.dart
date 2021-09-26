import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:water_del/screens/Home/Checkout.dart';
import 'package:water_del/utilities/global/pageTransitions.dart';
import 'package:water_del/widgets/global/MerchantProfile.dart';
import 'package:water_del/widgets/mapWidget.dart';

class ProductDetail extends StatefulWidget {
  ProductDetail({Key key}) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
      int _counter = 0;
      int price = 50;
  bool hasMinused = false;

// 

// write a function that increment the counter by 1 and multiply the counter by the price of the product
  void _incrementCounterAndMultiply() {
    setState(() {
      _counter++;
     ;
    });
  }

// write a function that decrement the counter by 1  checks if value is greater than 0 and multiply the counter by the price of the product
  void _decrementCounterAndDivide() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      
      }
    });
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF8B97A2),
            size: 28,
          ),
        ),
        title: Text(
          '',
          style: TextStyle(
            fontFamily: 'Lexend Deca',
            color: Color(0xFF151B1E),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
            child: Stack(
              children: [
                IconButton(
                  onPressed: () {
                    print('IconButton pressed ...');
                  },
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                    color: Color(0xFF95A1AC),
                    size: 30,
                  ),
                  iconSize: 30,
                ),
                Text( 
                  '$_counter',

                )
              ],
            ),
          )
        ],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.grey[900],
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Image.asset(
                        'assets/images/background.jpg',
                        width: MediaQuery.of(context).size.width,
                        height: 250,
                        fit: BoxFit.fitHeight,
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Sami Supp',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Lexend Deca',
                          ),
                        ),
                        Expanded(
                                                  child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(100, 0, 5, 10),
                            child: InkWell(
                              onTap: () async {
                                await showModalBottomSheet(

                                  isScrollControlled: true,
                                  context: context,
                                  
                                  builder: (context) {
                                    return 
                                    // 
                                    
                                    MerchantProfile();
                                  },
                                );
                              },
                              child: Container(
                                width: 150,
                                height: 50,
                                decoration: BoxDecoration(
                                  color:Colors.black,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Padding(
                                  padding:
                                      EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                                  child: Text(
                                    'See Profile',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFFEFEFEF),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Location',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Lexend Deca',
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Kahawa West',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFF1A69FD),
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Bottled Water',
                          style: TextStyle(
                            fontFamily: 'Playfair Display',
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Expanded(
                          child: Text(
                          // multipl
                            '@Ksh $price',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontFamily: 'Lexend Deca',
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(
                              color: Color(0xFFDBE2E7),
                              width: 2,
                            ),
                          ),
                          child: IconButton(
                            onPressed: _decrementCounterAndDivide,
                            icon: FaIcon(
                              FontAwesomeIcons.minus,
                              color: Color(0xFF8B97A2),
                              size: 20,
                            ),
                            iconSize: 20,
                          ),
                        ),
                        Container(
                          width: 70,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          alignment:
                              AlignmentDirectional(0, 0.1499999999999999),
                          child: Align(
                            alignment: AlignmentDirectional(0, 0.05),
                            child: AutoSizeText(
                              "${_counter}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Lexend Deca',
                                color: Color(0xFF090F13),
                                fontSize: 32,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(
                              color: Color(0xFFDBE2E7),
                              width: 2,
                            ),
                          ),
                          child: IconButton(
                            onPressed: _incrementCounterAndMultiply
                            
                            // call _multiplyCounter function
                           
                            ,
                            icon: Icon(
                              Icons.add,
                              color: Color(0xFF8B97A2),
                              size: 30,
                            ),
                            iconSize: 30,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 20),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: ()async{

              Navigator.of(context)
                  .push(SlideLeftTransition(page: CheckoutWidget(counter: _counter,price: price,)));
          },
                                      child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Color(0xFF503DF4),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                        child: Text(
                          'View Cart',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Lexend Deca',
                            color: Color(0xFFFAFDFF),
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
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
    );
  }
}
