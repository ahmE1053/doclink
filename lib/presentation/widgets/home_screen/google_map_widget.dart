import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../domain/entities/doctor.dart';

class MyGoogleMapWidget extends StatelessWidget {
  const MyGoogleMapWidget({
    super.key,
    required this.doctorClinicPosition,
    required this.mapController,
    required this.doctor,
  });

  final LatLng doctorClinicPosition;
  final ValueNotifier<GoogleMapController?> mapController;
  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onTap: (argument) async {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Open the maps app'),
            actions: [
              TextButton(
                onPressed: () async {
                  final url = Uri(
                    scheme: 'geo',
                    path:
                        '${doctorClinicPosition.latitude},${doctorClinicPosition.longitude}',
                    queryParameters: {
                      'q':
                          '${doctorClinicPosition.latitude},${doctorClinicPosition.longitude}',
                    },
                  );
                  if (await canLaunchUrl(url)) {
                    launchUrl(url);
                    context.pop();
                  } else {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Can\'t open maps app'),
                        ),
                      );
                      context.pop();
                    }
                  }
                },
                child: const Text('Yes'),
              ),
              TextButton(
                onPressed: () {
                  context.pop();
                },
                child: const Text('No'),
              )
            ],
          ),
        );
      },
      zoomControlsEnabled: false,
      onMapCreated: (controller) => mapController.value = controller,
      markers: {
        Marker(
          markerId: MarkerId(doctor.id),
          position: doctorClinicPosition,
        )
      },
      zoomGesturesEnabled: false,
      buildingsEnabled: false,
      scrollGesturesEnabled: false,
      initialCameraPosition: CameraPosition(
        target: doctorClinicPosition,
        zoom: 16,
      ),
    );
  }
}
