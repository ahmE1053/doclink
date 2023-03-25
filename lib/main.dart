import 'package:device_preview/device_preview.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';

import 'core/providers/router_provider.dart';
import 'data/data source/patient_remote_date_source.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final container = ProviderContainer(observers: [
    const WatchingProviders(),
  ]);
  final remoteDataSource = container.read(patientRemoteDataSourceProvider);
  runApp(
    UncontrolledProviderScope(
      container: container,
      child: DevicePreview(
        enabled: false,
        builder: (context) => const MyApp(),
      ),
    ),
  );
}

class WatchingProviders extends ProviderObserver {
  const WatchingProviders();

  @override
  void didAddProvider(ProviderBase<Object?> provider, Object? value,
      ProviderContainer container) {
    // print(
    //     'didAddProvider(ProviderBase<Object?> $provider, Object? $value,ProviderContainer $container');
  }

  @override
  void didDisposeProvider(
      ProviderBase<Object?> provider, ProviderContainer container) {
    // print(
    //     'didDisposeProvider(ProviderBase<Object?> $provider, ProviderContainer $container)');
  }

  @override
  void didUpdateProvider(ProviderBase<Object?> provider, Object? previousValue,
      Object? newValue, ProviderContainer container) {
    // print(
    //     ' didUpdateProvider(ProviderBase<Object?> $provider, Object? $previousValue,Object? $newValue, ProviderContainer $container)');
  }

  @override
  void providerDidFail(ProviderBase<Object?> provider, Object? error,
      StackTrace stackTrace, ProviderContainer container) {
    // print(
    //     'providerDidFail(ProviderBase<Object?> $provider, Object? $error,StackTrace $stackTrace, ProviderContainer $container) ');
  }
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        colorSchemeSeed: const Color(0xff7b50e7),
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: const Color(0xff7b50e7),
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      routerConfig: ref.watch(goRouterProvider),
    );
  }
}
