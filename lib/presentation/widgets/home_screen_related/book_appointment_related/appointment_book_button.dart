import 'package:doclink/core/providers/router_provider.dart';
import 'package:doclink/domain/entities/doctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../core/providers/book_appointment_provider.dart';
import '../../../../core/utilities/appointment_error_state.dart';
import '../../../../domain/entities/appointment.dart';

class AppointmentBookButton extends HookConsumerWidget {
  const AppointmentBookButton({
    super.key,
    required this.bottomButtonSize,
    required this.formKey,
    required this.errorState,
    required this.phoneController,
    required this.additionalInfoController,
    required this.id,
    required this.doctor,
  });

  final ValueNotifier<double> bottomButtonSize;
  final GlobalKey<FormState> formKey;
  final ValueNotifier<AppointmentErrorState> errorState;
  final TextEditingController phoneController;
  final TextEditingController additionalInfoController;
  final String id;
  final Doctor doctor;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loading = useState(false);
    final location = ref.watch(bookAppointmentProvider).appointmentLocation;
    final mq = MediaQuery.of(context).size;
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        if (location == AppointmentLocation.atClinic &&
            !doctor.availableOffline) {
          bottomButtonSize.value = 0;
        } else if (location == AppointmentLocation.online &&
            !doctor.availableOnline) {
          bottomButtonSize.value = 0;
        } else {
          bottomButtonSize.value = mq.height * 0.07;
        }
      },
    );
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      height: bottomButtonSize.value,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Builder(builder: (context) {
          if (loading.value) {
            return SpinKitDualRing(
                color: Theme.of(context).colorScheme.primaryContainer);
          }
          return ElevatedButton(
            onPressed: () async {
              loading.value = true;
              if (formKey.currentState!.validate()) {
                final result = await ref
                    .read(bookAppointmentProvider.notifier)
                    .registerAppointment(
                      context,
                      errorState,
                      phoneController.value.text,
                      additionalInfoController.value.text,
                      id,
                    );
                if (result) {
                  ref.read(bookAppointmentProvider.notifier).reset();
                  ref.read(routerHandlerProvider.notifier).enterFromPath(
                        '/home/appointmentsSuccess',
                      );
                }
              }
              loading.value = false;
            },
            child: const Text('Book'),
          );
        }),
      ),
    );
  }
}
