import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:doclink/domain/entities/doctor.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

Future<Uint8List> getMap(ClinicLocation location) async {
  final request = await Dio().post(
    'https://maps.googleapis.com/maps/api/staticmap',
    queryParameters: {
      'zoom': 16,
      'size': '400x200',
      'markers': '${location.coordinates[0]},${location.coordinates[1]}',
      'key': 'AIzaSyA-2Ti0iBEIYtgb1Ga6Jsn_94pR4n9PJRc',
    },
    options: Options(
      responseType: ResponseType.bytes,
    ),
  );

  return request.data;
}

Future<void> openMapsApp(
    BuildContext context, LatLng doctorClinicPosition) async {
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
              if (context.mounted) context.pop();
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
}
