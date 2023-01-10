import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Maps extends StatefulWidget {
  const Maps({super.key});

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  late GoogleMapController mapController;
  Set<Marker> _marker = Set();
  static const LatLng _initialCameraPosition = const LatLng(41.69893, 20.6421);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    mapController.dispose();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hastaneler"),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition:
            CameraPosition(target: _initialCameraPosition, zoom: 11.5),
        markers: myMarker(),
        mapType: MapType.normal,
        myLocationEnabled: true,
        compassEnabled: true,
        myLocationButtonEnabled: true,
      ),
      /*floatingActionButton: FloatingActionButton(onPressed: () {
        mapController.animateCamera(
          CameraPosition(target: LatLng(45,45),zoom: 11)
        );
      },),*/
    );
  }

  Set<Marker> myMarker() {
    setState(() {
      _marker.add(Marker(
          markerId: MarkerId(_initialCameraPosition.toString()),
          position: _initialCameraPosition,
          infoWindow: InfoWindow(title: "Ses", snippet: "4 yıldız reyting"),
          icon: BitmapDescriptor.defaultMarker));
    });
    return _marker;
  }
}
        /*<iframe src="https://storage.googleapis.com/maps-solutions-zz2hulji2s/locator-plus/1abf/locator-plus.html"
  width="100%" height="100%"
  style="border:0;"
  loading="lazy">
</iframe>*/