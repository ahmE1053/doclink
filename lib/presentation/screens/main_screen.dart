import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../core/providers/router_provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key, required this.child}) : super(key: key);
  final Widget Function() child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child(),
      bottomNavigationBar: Consumer(
        builder: (context, ref, child) {
          final routerProvider = ref.watch(routerHandlerProvider);
          final currentIndex = routerProvider.currentIndex;
          return SalomonBottomBar(
            currentIndex: currentIndex,
            onTap: (index) {
              ref
                  .read(routerHandlerProvider.notifier)
                  .enterNewScreenFromNavBar(index);
            },
            margin: const EdgeInsets.all(16),
            items: [
              SalomonBottomBarItem(
                icon: const Icon(Icons.home_outlined),
                activeIcon: const Icon(Icons.home),
                title: const Text('Home'),
              ),
              SalomonBottomBarItem(
                icon: const Icon(Icons.calendar_month_outlined),
                activeIcon: const Icon(Icons.calendar_month),
                title: const Text('Appointments'),
              ),
              SalomonBottomBarItem(
                icon: const Icon(Icons.email_outlined),
                activeIcon: const Icon(Icons.email),
                title: const Text('Messages'),
              ),
              SalomonBottomBarItem(
                icon: const Icon(Icons.person_outline),
                activeIcon: const Icon(Icons.person),
                title: const Text('Profile'),
              ),
            ],
          );
        },
      ),
    );
  }
}
