import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:water_del/screens/home/profilePage.dart';
import 'package:water_del/utilities/global/pageTransitions.dart';

class SupplierHome extends StatefulWidget {
  final FirebaseUser user;
  SupplierHome({@required this.user});

  @override
  _SupplierHomeState createState() => _SupplierHomeState();
}

class _SupplierHomeState extends State<SupplierHome> {
  int _currentIndex = 0;
  PageController _pageController;

  static menuItemTemplate(String title, IconData icon, Color color) {
    return BottomNavyBarItem(
        textAlign: TextAlign.center,
        icon: Icon(icon),
        title: Text(
          title,
          style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w700, letterSpacing: 0.5),
        ),
        activeColor: color);
  }

  List<BottomNavyBarItem> items = [
    menuItemTemplate('Orders', Icons.history, Colors.greenAccent[700]),
    menuItemTemplate('Products', Icons.category, Colors.redAccent[700]),
    menuItemTemplate('Reviews', Icons.rate_review, Colors.blueAccent[700])
  ];

  List<Widget> pages = [Container(), Container(), Container()];

  Widget _appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      actions: [
        IconButton(
          icon: Icon(
            Icons.person,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context)
              .push(SlideLeftTransition(page: ProfilePage(user: widget.user))),
        )
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  itemSelector(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.animateToPage(_currentIndex,
          duration: Duration(milliseconds: 300), curve: Curves.decelerate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      backgroundColor: Colors.white,
      body: SizedBox.expand(
        child: PageView.builder(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => pages[index],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
          items: items,
          selectedIndex: _currentIndex,
          onItemSelected: itemSelector),
    );
  }
}
