import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';

import '../../data/data source/patient_remote_date_source.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future.delayed(
      const Duration(seconds: 3),
      () => WidgetsBinding.instance.addPostFrameCallback(
        (timeStamp) {
          if (context.mounted) {
            ref.watch(remoteDataSourceProvider).when(
                  data: (data) {
                    if (data == null) {
                      context.go('/auth');
                    } else {
                      context.go('/home');
                    }
                  },
                  error: (error, stackTrace) => null,
                  loading: () => null,
                );
          }
        },
      ),
    );
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: mq.width * 0.8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                child: Lottie.asset(
                  'assets/lottie/splash.json',
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: mq.width * 0.1),
                child: Image.asset(
                  Theme.of(context).brightness == Brightness.dark
                      ? 'assets/images/doclink-white.png'
                      : 'assets/images/doclink-dark.png',
                  fit: BoxFit.fill,
                  // fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
