import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:water_del/utilities/global/pageTransitions.dart';
import 'package:water_del/widgets/global/loading_page.dart';
import '../Home/productdetailpage.dart';

class MarkersMap extends StatefulWidget {
  @override
  _MarkersMapState createState() => _MarkersMapState();
}

class _MarkersMapState extends State<MarkersMap> {
  GoogleMapController _mapcontroller;

  List<Marker> allMarkers = [];
  var currentLocation;
  PageController _pageController;
  var category = [];
  var categories;
  var merchants = [];
  int prevPage;

  bool mapToggle = false;

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  initMarkers(specify, specifyID) async {
    var markerIdValue = specifyID;
    final MarkerId markerId = MarkerId(markerIdValue);
    final Marker marker = Marker(
      markerId: markerId,
      draggable: false,
      infoWindow:
          InfoWindow(title: specify['shopName'], snippet: specify['address']),
      position:
          LatLng(specify["location"].latitude, specify["location"].longitude),
    );
    setState(() {
      markers[markerId] = marker;
    });
  }

  void zoomOnMarker(value) {
    _mapcontroller.animateCamera(CameraUpdate.newLatLngZoom(
        LatLng(value["location"].latitude, value["location"].longitude), 12));
  }

  populateMarkers() {
    FirebaseFirestore.instance.collection('merchants').get().then((value) {
      if (value.docs.isNotEmpty) {
        for (int i = 0; i < value.docs.length; i++) {
          // initMarkers(value.docs[i].data(), value.docs[i].id);
          // merchants.add(value.docs[i].data());
          // add  value.docs[i].data() to merchants
          merchants.add(value.docs[i].data());
        }
 
      } else
        Fluttertoast.showToast(
          msg: "No merchants found",
          toastLength: Toast.LENGTH_SHORT,
        );
    });
  }

// PopulateMarkeers initstate

  void _onScroll() {
    if (_pageController.page.toInt() != prevPage) {
      prevPage = _pageController.page.toInt();
      moveCamera();
    }
  }

  moveCamera() {
    _mapcontroller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: merchants[_pageController.page.toInt()]['location'],
        zoom: 14.0,
        bearing: 45.0,
        tilt: 45.0)));
  }

  LatLng latlong;

  @override
  void initState() {
    getCurrentLocation();

    populateMarkers();
    super.initState();
    Geolocator.getCurrentPosition().then((value) {
      setState(() {
        value = currentLocation;
        mapToggle = true;
        categories = category.toSet().toList();
      });
    });
    //page controller
    _pageController = PageController(initialPage: 1, viewportFraction: 0.8)
      ..addListener(_onScroll);
  }

  Future getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission != PermissionStatus.granted) {
      LocationPermission permission = await Geolocator.requestPermission();
      if (permission != PermissionStatus.granted) getLocation();
      return;
    }
    getLocation();
  }

  getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position.latitude);

    setState(() {
      latlong = new LatLng(position.latitude, position.longitude);
    });
    // getCurrentAddress();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mapToggle == true
          ? Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height - 50.0,
                  width: MediaQuery.of(context).size.width,
                  child: GoogleMap(
                    markers: Set.from(markers.values),
                    onMapCreated: mapCreated,
                    mapType: MapType.normal,
                    myLocationEnabled: true,
                    initialCameraPosition:
                        CameraPosition(
                          // target: latlong, zoom: 12.0
                         target: LatLng(-1.2320662, 36.8780867), zoom: 12.0
                          ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  child: Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: merchants.length,
                      itemBuilder: (BuildContext context, int index) {
                        return getCategoryUI(merchants[index]);
                      },
                    ),
                  ),
                )
              ],
            )
          : LoadingPage(),
    );
  }

  void mapCreated(controller) {
    setState(() {
      _mapcontroller = controller;
    });
  }

  Widget getCategoryUI(value) {
    return InkWell(
        onTap: () async {
            print("START ${markers} END");
          // Navigator.of(context)
          //     .push(SlideLeftTransition(page: ProductDetail()));
        },
        child: Stack(children: [
          Center(
              child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 20.0,
                  ),
                  height: 125.0,
                  width: 275.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black54,
                          offset: Offset(0.0, 4.0),
                          blurRadius: 10.0,
                        ),
                      ]),
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white),
                      child: Row(children: [
                        Expanded(
                          child: Container(
                            height: 90.0,
                            width: 90.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10.0),
                                    topLeft: Radius.circular(10.0)),
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/background.jpg'))
                                // image: DecorationImage(
                                //    fit: BoxFit.cover,
                                //     image: NetworkImage(
                                //         value['thumbNail']
                                //    ) ??Image.asset("assets/images/background.jpg"),
                                //    )
                                ),
                          ),
                        ),
                        SizedBox(width: 5.0),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                value['shopName'],
                                style: TextStyle(
                                    fontSize: 12.5,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                value['address'],
                                style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w600),
                              ),
                              Container(
                                width: 170.0,
                                child: Text(
                                  value['description'],
                                  style: TextStyle(
                                      fontSize: 11.0,
                                      fontWeight: FontWeight.w300),
                                ),
                              )
                            ])
                      ]))))
        ]));
  }
}
