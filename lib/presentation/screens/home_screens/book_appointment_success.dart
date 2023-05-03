import 'package:doclink/core/consts/app_typography.dart';
import 'package:doclink/core/providers/router_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';

class BookAppointmentSuccessScreen extends ConsumerWidget {
  const BookAppointmentSuccessScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Lottie.asset('assets/lottie/success.json', repeat: false),
            const SizedBox(height: 16),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                'Your appointment has been registered successfully.',
                style: AppTypography.semiHeadlineSize(context),
              ),
            ),
            const SizedBox(height: 16),
            Align(
              child: ElevatedButton(
                onPressed: () {
                  ref
                      .read(routerHandlerProvider.notifier)
                      .enterNewScreenFromNavBar(0);
                },
                child: const Text('Home'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
