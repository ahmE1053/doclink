import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../core/consts/app_typography.dart';
import '../../../data/data source/doctor_remote_data_source.dart';
import '../../widgets/authentication_handling_widgets/my_text_field_widget.dart';
import '../../widgets/home_screen/book_appointment_screen/appointment_location_transition_handler.dart';

class BookAppointmentScreen extends HookConsumerWidget {
  const BookAppointmentScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phoneController = useTextEditingController();
    final additionalInfoController = useTextEditingController();
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final mq = MediaQuery.of(context).size;
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Book Appointment',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: ref.watch(doctorsNotifierProvider).when(
                data: (doctorInfo) {
                  final doctor = doctorInfo
                      .where((doctorInfo) => doctorInfo.id == id)
                      .single;
                  return ListView(
                    children: [
                      AppointmentLocationTransitionHandler(
                        doctor: doctor,
                        colorScheme: colorScheme,
                        mq: mq,
                        textInfo: Form(
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const SizedBox(height: 8),
                              MyTextField(
                                controller: phoneController,
                                colorScheme: colorScheme,
                                label: 'Phone Number',
                                suffix: const Icon(Icons.phone),
                                validator: (value) {
                                  if (!value!.isPhoneValid()) {
                                    return 'This phone number is not correct';
                                  }
                                  return null;
                                },
                                inputType: TextInputType.phone,
                                formatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                              ),
                              const SizedBox(height: 8),
                              MyTextField(
                                controller: additionalInfoController,
                                colorScheme: colorScheme,
                                label: 'Additional Info',
                                maxLines: 3,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Day',
                                style: AppTypography.bodySize(
                                  context,
                                  colorScheme.surfaceTint,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
                error: (error, stackTrace) => const Center(
                  child: Text('An error occurred, please try again later'),
                ),
                loading: () => Center(
                  child: SpinKitFadingGrid(),
                ),
              ),
        ),
        bottomNavigationBar: SizedBox(
          height: mq.height * 0.07,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                if (!formKey.currentState!.validate()) {}
              },
              child: const Text('Book'),
            ),
          ),
        ),
      ),
    );
  }
}

enum TimeStates {
  selected,
  available,
  disabled,
}
