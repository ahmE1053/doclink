import 'package:doclink/core/providers/book_appointment_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../core/consts/app_typography.dart';
import '../../../../domain/entities/appointment.dart';
import '../../../../domain/entities/doctor.dart';
import 'offline_date_selector/offline_booking_date_selector.dart';
import 'online_date_selector/online_booking_date_selector.dart';

class AppointmentLocationTransitionHandler extends HookConsumerWidget {
  const AppointmentLocationTransitionHandler({
    Key? key,
    required this.textInfo,
    required this.doctor,
    required this.mq,
    required this.colorScheme,
  }) : super(key: key);
  final Widget textInfo;
  final Doctor doctor;
  final ColorScheme colorScheme;
  final Size mq;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final location = useState(AppointmentLocation.atClinic);
    final animationController =
        useAnimationController(duration: const Duration(milliseconds: 500));
    final onlineTransitionAnimation =
        Tween<Offset>(begin: const Offset(1.5, 0), end: Offset.zero)
            .animate(animationController);
    final offlineTransitionAnimation =
        Tween<double>(begin: 1.0, end: 0.0).animate(animationController);
    useEffect(() => null, [animationController]);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Please fill the remaining info',
          style: AppTypography.semiHeadlineSize(context),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: RadioListTile(
                title: Text(
                  'At clinic',
                  style: AppTypography.semiBodySize(context),
                ),
                value: AppointmentLocation.atClinic,
                groupValue: location.value,
                onChanged: (value) {
                  final appointment = ref.read(bookAppointmentProvider);
                  ref.read(bookAppointmentProvider.notifier).copyWith(
                        appointment.copyWith(
                          time: '',
                          day: '',
                          appointmentLocation: value!,
                        ),
                      );
                  ref
                      .read(selectedOnlineDayTimes.notifier)
                      .update((state) => []);
                  animationController.reverse();
                  location.value = AppointmentLocation.atClinic;
                },
                selected: location.value == AppointmentLocation.atClinic,
              ),
            ),
            Expanded(
              child: RadioListTile(
                title: Text(
                  'Online',
                  style: AppTypography.semiBodySize(context),
                ),
                value: AppointmentLocation.online,
                groupValue: location.value,
                onChanged: (value) {
                  final appointment = ref.read(bookAppointmentProvider);
                  ref.read(bookAppointmentProvider.notifier).copyWith(
                        appointment.copyWith(
                          time: '',
                          day: '',
                          appointmentLocation: value!,
                        ),
                      );
                  ref
                      .read(selectedOfflineDayTimes.notifier)
                      .update((state) => null);
                  animationController.forward();
                  location.value = AppointmentLocation.online;
                },
                selected: location.value == AppointmentLocation.online,
              ),
            ),
          ],
        ),
        textInfo,
        const SizedBox(height: 16),
        Stack(
          children: [
            AnimatedBuilder(
              builder: (context, _) {
                return Opacity(
                  opacity: offlineTransitionAnimation.value,
                  child: Builder(
                    builder: (context) {
                      if (!doctor.availableOffline) {
                        return Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Text(
                            'Dr. ${doctor.name} does not currently have any available appointment '
                            'slots. Please check back later for updated availability.'
                            ' We apologize for any inconvenience this may cause.',
                            style: AppTypography.semiBodySize(context),
                          ),
                        );
                      }
                      return OfflineBookingDateSelector(
                        mq: mq,
                        doctor: doctor,
                        colorScheme: colorScheme,
                      );
                    },
                  ),
                );
              },
              animation: offlineTransitionAnimation,
            ),
            SlideTransition(
              position: onlineTransitionAnimation,
              child: Builder(
                builder: (context) {
                  if (!doctor.availableOnline) {
                    return Text(
                      'Dr. ${doctor.name} does not currently have any available appointment slots.'
                      'Please check back later for updated availability. We apologize '
                      'for any inconvenience this may cause.',
                    );
                  }
                  return OnlineBookingDateSelector(
                    mq: mq,
                    doctor: doctor,
                    colorScheme: colorScheme,
                  );
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}
