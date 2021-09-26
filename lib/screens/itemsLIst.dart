import 'package:flutter/material.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'add_products.dart';

class ItemsLIstWidget extends StatefulWidget {
  ItemsLIstWidget({Key key}) : super(key: key);

  @override
  _ItemsLIstWidgetState createState() => _ItemsLIstWidgetState();
}

class _ItemsLIstWidgetState extends State<ItemsLIstWidget> with SingleTickerProviderStateMixin{
  Animation<double> _animation;
  AnimationController _animationController;
  TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
  textController = TextEditingController();      
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 260),
    );

    final curvedAnimation = CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF1F4F8),
      floatingActionButton: FloatingActionBubble(
        // Menu items
        items: <Bubble>[

          // Floating action menu item
          Bubble(
            title:"Add Product",
            iconColor :Colors.white,
            bubbleColor : Colors.blue,
            icon:Icons.book,
            titleStyle:TextStyle(fontSize: 16 , color: Colors.white),
            onPress: () {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (context) {
                              return Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.8,
                                child: AddproductWidget(),
                              );
                            },
                          );
                        
              _animationController.reverse();
            },
          ),

        ],

        // animation controller
        animation: _animation,

        // On pressed change animation state
        onPress: _animationController.isCompleted
            ? _animationController.reverse
            : _animationController.forward,
        
        // Floating Action button Icon color
        iconColor: Colors.blue,

        // Flaoting Action button Icon 
        icon: AnimatedIcons.add_event,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Container(
                height: 140,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(
                    color: Color(0xFFDBE2E7),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 34, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'My Products',
                              style: TextStyle(
                                fontFamily: 'Ubuntu',
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ),

                      // Search//
                      Padding(
                        padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: Colors.white,
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                                  child: Icon(
                                    Icons.search,
                                    color: Color(0xFF95A1AC),
                                    size: 24,
                                  ),
                                ),
                                Expanded(
                                  flex: 10,
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                                    child: TextFormField(
                                      controller: textController,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Search for products',
                                        labelStyle: TextStyle(
                                          fontFamily: 'Ubuntu',
                                          color: Color(0xFF82878C),
                                        ),
                                        hintStyle: TextStyle(
                                          fontFamily: 'Ubuntu',
                                          color: Color(0xFF95A1AC),
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x004B39EF),
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x004B39EF),
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                      ),
                                      style: TextStyle(
                                        fontFamily: 'Ubuntu',
                                        color: Color(0xFF151B1E),
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.tune_rounded,
                                  color: Color(0xFF95A1AC),
                                  size: 24,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          //

          SizedBox(
            height: 10,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(16, 12, 0, 12),
                        child: Text(
                          'All Products',
                          style: TextStyle(
                            fontFamily: 'Ubuntu',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(

                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            border: Border.all(
                              color: Color(0xFFC8CED5),
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 60,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.asset(
                              'assets/images/background.jpg'
                              ,
                              fit: BoxFit.cover,
                            ) ,
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'Bottled  Water ',
                                          style: TextStyle(
                                            fontFamily: 'Ubuntu',
                                            color: Color(0xFF15212B),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 4, 4, 0),
                                            child: Text(
                                              'Available',
                                              style: TextStyle(
                                                fontFamily: 'Ubuntu',
                                                color: Colors.blue,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.blue,
                                      size: 24,
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
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        onTap: ()  {
                        // onTap: () async {
                        //   await showModalBottomSheet(
                        //     isScrollControlled: true,
                        //     context: context,
                        //     builder: (context) {
                        //       return Container(
                        //         height:
                        //             MediaQuery.of(context).size.height * 0.8,
                        //         child: AddproductWidget(),
                        //       );
                        //     },
                        //   );
                        // },
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            border: Border.all(
                              color: Color(0xFFC8CED5),
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 60,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.network(
                                        'https://images.unsplash.com/photo-1501700493788-fa1a4fc9fe62?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=681&q=80',
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'Water Truck services',
                                          style: TextStyle(
                                            fontFamily: 'Ubuntu',
                                            color: Color(0xFF15212B),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 4, 4, 0),
                                            child: Text(
                                              'Not Available',
                                              style: TextStyle(
                                                fontFamily: 'Ubuntu',
                                                color: Color(0xFFD7070B),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.blue,
                                      size: 24,
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
          )
        ],
      ),
    );
  }
}

