import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GoogleMapController? _mapController;
  LatLng? _currentPosition;
  Marker? _currentMarker;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation(); // 여기서 위치 추적 시작
  }

  Future<void> _getCurrentLocation() async {
    // 위치 권한 요청
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
    }

    // 현재 위치 1회 받아오기
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    LatLng newPosition = LatLng(position.latitude, position.longitude);

    setState(() {
      _currentPosition = newPosition;
      _currentMarker = Marker(
        markerId: const MarkerId('currentLocation'),
        position: newPosition,
      );
    });

    // 이후 실시간 위치 업데이트
    Geolocator.getPositionStream().listen((Position position) {
      LatLng updatedPosition = LatLng(position.latitude, position.longitude);

      setState(() {
        _currentPosition = updatedPosition;
        _currentMarker = Marker(
          markerId: const MarkerId('currentLocation'),
          position: updatedPosition,
        );
      });

      _mapController?.animateCamera(
        CameraUpdate.newLatLng(updatedPosition),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentPosition == null
          ? const Center(child: CircularProgressIndicator())
          : GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _currentPosition!,
                zoom: 16,
              ),
              markers: {
                if (_currentMarker != null) _currentMarker!,
              },
              onMapCreated: (controller) {
                _mapController = controller;
              },
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
            ),
    );
  }
}
