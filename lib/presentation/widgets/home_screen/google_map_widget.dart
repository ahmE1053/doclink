import 'package:doclink/core/utilities/open_maps_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../domain/entities/doctor.dart';

class MyGoogleMapWidget extends HookWidget {
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
    final dioRequest = useMemoized(
      () => getMap(doctor.location),
    );
    final imageData = useFuture(dioRequest);
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Builder(
        builder: (context) {
          if (imageData.data == null) {
            return Center(
              child: SpinKitDoubleBounce(
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
            );
          }
          return GestureDetector(
            onTap: () {
              openMapsApp(context, doctorClinicPosition);
            },
            child: Image.memory(
              imageData.data!,
              fit: BoxFit.fill,
            ),
          );
        },
      ),
      // child: GoogleMap(
      //   zoomControlsEnabled: false,
      //   onMapCreated: (controller) => mapController.value = controller,
      //   mapToolbarEnabled: false,
      //   markers: {
      //     Marker(
      //       infoWindow: InfoWindow(title: doctor.location.location),
      //       consumeTapEvents: false,
      //       // onTap: () {
      //       //   openMapsApp(context, doctorClinicPosition);
      //       // },
      //       markerId: MarkerId(doctor.id),
      //       position: doctorClinicPosition,
      //       icon: BitmapDescriptor.defaultMarkerWithHue(
      //         BitmapDescriptor.hueAzure,
      //       ),
      //     )
      //   },
      //   zoomGesturesEnabled: false,
      //   buildingsEnabled: false,
      //   scrollGesturesEnabled: false,
      //   initialCameraPosition: CameraPosition(
      //     target: doctorClinicPosition,
      //     zoom: 16,
      //   ),
      //   onTap: (argument) {
      //     openMapsApp(context, doctorClinicPosition);
      //   },
      // ),
    );
  }
}
