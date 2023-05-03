import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../data/data source/appointments_remote_data_source.dart';

class CancelAppointmentButton extends ConsumerWidget {
  const CancelAppointmentButton({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () async {
        showDialog(
          context: context,
          builder: (context) {
            bool loading = false;
            return StatefulBuilder(
              builder: (context, setState) {
                return AlertDialog(
                  title: const Text(
                      'Are you sure that you to cancel this appointment?'),
                  actions: loading
                      ? [
                          SpinKitChasingDots(
                            color: Theme.of(context).colorScheme.primary,
                            size: 20,
                          ),
                        ]
                      : [
                          ElevatedButton(
                            onPressed: () async {
                              loading = true;
                              setState(
                                () {},
                              );
                              await ref
                                  .read(appointmentNotifierProvider.notifier)
                                  .cancelAppointment(id);
                              if (context.mounted) {
                                Navigator.pop(context);
                              }
                            },
                            child: const Text('Yes'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('No'),
                          ),
                        ],
                );
              },
            );
          },
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      child: const FittedBox(child: Text('Cancel')),
    );
  }
}
