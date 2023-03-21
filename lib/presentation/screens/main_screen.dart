import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/providers/router_provider.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({Key? key, required this.child}) : super(key: key);
  final Widget Function() child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: child(),
      bottomNavigationBar: ConvexAppBar(
        key: ref.watch(routerHandlerProvider.notifier).convexBottomBarKey,
        disableDefaultTabController: true,
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        activeColor: Theme.of(context).colorScheme.onSecondaryContainer,
        style: TabStyle.reactCircle,
        color: Theme.of(context).colorScheme.onSecondaryContainer,
        onTap: (index) {
          ref
              .read(routerHandlerProvider.notifier)
              .enterNewScreenFromNavBar(index);
        },
        items: const [
          TabItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            title: 'Home',
            isIconBlend: true,
          ),
          TabItem(
            icon: Icon(Icons.calendar_month_outlined),
            activeIcon: Icon(Icons.calendar_month),
            title: 'Appointments',
            isIconBlend: true,
          ),
          TabItem(
            icon: Icon(Icons.email_outlined),
            activeIcon: Icon(Icons.email),
            title: 'Messages',
            isIconBlend: true,
          ),
          TabItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            title: 'Profile',
            isIconBlend: true,
          ),
        ],
      ),
    );
  }
}
