import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';



// create model class called Merchant for the data below
// String address
// String description
// String id
// GeoPoint location (geopoint)
// String merchtype
// String shopName
// String thumbNail

class Merchant{
  String address;
  String description;
  String id;
  GeoPoint location;
  String merchtype;
  String shopName;
  String thumbNail;

  Merchant({
    this.address,
    this.description,
    this.id,
    this.location,
    this.merchtype,
    this.shopName,
    this.thumbNail,
  });

  factory Merchant.fromJson(Map<String, dynamic> json){
    return Merchant(
      address: json['address'],
      description: json['description'],
      id: json['id'],
      location: GeoPoint(json['location']['latitude'], json['location']['longitude']),
      merchtype: json['merchtype'],
      shopName: json['shopName'],
      thumbNail: json['thumbNail'],
    );
  }
}


