import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:water_del/models/locationModel.dart';
import 'package:water_del/models/orderModel.dart';
import 'package:water_del/models/product.dart';
import 'package:water_del/widgets/global/product_info_dialog.dart';

class ProductMapWidget extends StatefulWidget {
  final LocationModel location;
  final FirebaseUser user;
  final List<Product> products;
  ProductMapWidget(
      {@required this.products, @required this.user, @required this.location});

  @override
  _ProductMapWidgetState createState() => _ProductMapWidgetState();
}

class _ProductMapWidgetState extends State<ProductMapWidget> {
  Completer<GoogleMapController> _controller = Completer();
  final Map<String, Marker> _markers = {};
  LocationModel myLocation;
  OrderModel order;
  BitmapDescriptor pinLocationIcon;

  Future showDetailsDialog(Product product) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => ProductInfoDialog(
        product: product,
        orderModel: order,
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        _markers.clear();
        for (var item in widget.products) {
          print(item.details);
          double latitude = item.details['location']['latitude'];
          double longitude = item.details['location']['longitude'];
          String itemIndex = widget.products.indexOf(item).toString();
          final marker = Marker(
              markerId: MarkerId(itemIndex),
              onTap: () => showDetailsDialog(item),
              position: LatLng(latitude, longitude),
              icon: pinLocationIcon);
          _markers[itemIndex] = marker;
        }
      });
    });
  }

  void setCustomMapPin() async {
    pinLocationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5),
        'assets/images/map_marker.png');
  }

  @override
  void initState() {
    order = context.read<OrderModel>();
    order.location = widget.location;
    setCustomMapPin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    myLocation = widget.location;
    double lat = myLocation.latitude;
    double lon = myLocation.longitude;
    return GoogleMap(
        onMapCreated: _onMapCreated,
        myLocationEnabled: true,
        zoomControlsEnabled: false,
        markers: _markers.values.toSet(),
        initialCameraPosition:
            CameraPosition(target: LatLng(lat, lon), zoom: 15, bearing: 45));
  }
}
