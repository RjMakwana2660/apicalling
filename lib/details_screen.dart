import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'Modal/data_modal.dart';
class DetailsView extends StatefulWidget {
  ItemModal itemModal;
  DetailsView({Key? key,required this.itemModal}) : super(key: key);

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  CameraPosition? initialPositions ;
  Map<MarkerId, Marker> markers = <MarkerId, Marker> {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialPositions = CameraPosition(target: LatLng(widget.itemModal.lat, widget.itemModal.lon),zoom: 10.0,);
    markers[MarkerId('place_name')] = Marker(
          markerId: const MarkerId('selectedLocation'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          position: LatLng(widget.itemModal.lat, widget.itemModal.lon),
          // infoWindow: InfoWindow(
          //   title: "${currentPosition.latitude} , ${currentPosition.longitude}",
          // )
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          // Expanded(child: Text('Map with Lat Long ${widget.itemModal.lat}  ${widget.itemModal.lon}')),
          Flexible(
            flex: 2,
            child: GoogleMap(
                markers: markers.values.toSet(),
                initialCameraPosition: initialPositions?? const CameraPosition(target: LatLng(23.721, 73.22145),zoom: 10.0,),
            )
          ),

          Flexible(
            flex: 1,
            child: Text('DAta')
          ),
        ],
      ),
    );
  }
}
