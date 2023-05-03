import 'package:doclink/core/consts/app_typography.dart';
import 'package:doclink/core/utilities/text_widget.dart';
import 'package:doclink/data/data%20source/appointments_remote_data_source.dart';
import 'package:doclink/data/data%20source/doctor_remote_data_source.dart';
import 'package:doclink/presentation/widgets/authentication_handling_widgets/my_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../domain/entities/doctor.dart';

class LeaveReviewButton extends ConsumerWidget {
  const LeaveReviewButton({
    Key? key,
    required this.doctor,
    required this.appointmentId,
  }) : super(key: key);
  final Doctor doctor;
  final String appointmentId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              child: LeaveReviewWidget(
                appointmentId: appointmentId,
                doctor: doctor,
              ),
            );
          },
        );
      },
      child: const Text('Leave a Review'),
    );
  }
}

class LeaveReviewWidget extends HookConsumerWidget {
  const LeaveReviewWidget({
    Key? key,
    required this.doctor,
    required this.appointmentId,
  }) : super(key: key);
  final Doctor doctor;
  final String appointmentId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rating = useState(0.0);
    final loading = useState(false);
    final reviewText = useTextEditingController();
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Leave a rating',
            style: AppTypography.semiHeadlineSize(context, colorScheme.primary),
          ),
          const SizedBox(height: 8),
          Center(
            child: RatingBar.builder(
              allowHalfRating: true,
              itemCount: 5,
              updateOnDrag: true,
              direction: Axis.horizontal,
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: colorScheme.primary,
              ),
              onRatingUpdate: (value) {
                rating.value = value;
              },
            ),
          ),
          const SizedBox(height: 16),
          MyTextField(
            controller: reviewText,
            colorScheme: colorScheme,
            maxLines: 3,
            label: 'Review (Optional)',
            inputAction: TextInputAction.newline,
            inputType: TextInputType.multiline,
          ),
          const SizedBox(height: 16),
          Builder(
            builder: (context) {
              if (loading.value) {
                return SpinKitChasingDots(color: colorScheme.primary);
              }
              return ElevatedButton(
                onPressed: () async {
                  loading.value = true;
                  print(doctor.id);
                  print(appointmentId);
                  await ref.read(doctorsNotifierProvider.notifier).leaveReview(
                        doctor,
                        Review(
                          rating: rating.value,
                          review: reviewText.value.text,
                        ),
                      );
                  await ref
                      .read(appointmentNotifierProvider.notifier)
                      .changeReviewOrCancellationReasonState(
                        appointmentId,
                        didLeaveReview: true,
                      );
                  if (context.mounted) {
                    Navigator.pop(context);
                    return;
                  }
                  loading.value = false;
                },
                child: const Text('Submit'),
              );
            },
          ),
        ],
      ),
    );
  }
}
